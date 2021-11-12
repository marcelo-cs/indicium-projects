with
    creditcard as (
        select *
        from {{ ref('dim_creditcard')}}
    )
    ,customer as (
        select *
        from {{ref('dim_customer')}}
    )
    , employee as (
        select *
        from {{ref('dim_employee')}}
    )
    , person_address as (
        select *
        from {{ref('dim_local')}}
    )
    , product as (
        select *
        from {{ref('dim_products')}}
    )
    , reason as (
        select *
        from {{ref('dim_reason')}}
    )
    , order_header_with_sk as (
        select
            order_header.salesorderid
            , creditcard.creditcard_sk as creditcard_fk
            , customer.customer_sk as customer_fk
            , employee.salesperson_sk as salesperson_fk
            , person_address.personaddress_sk as personaddress_fk
            , reason.salesorder_sk as salesorder_fk

            , order_header.subtotal
            , order_header.taxamt
            , order_header.freight
            , order_header.totaldue
            , order_header.orderdate
            , order_header.duedate
            , order_header.shipdate
            , order_header.order_status

        from {{ref('stg_salesorderheader')}} as order_header
        left join creditcard on order_header.creditcardid = creditcard.creditcardid
        left join customer on order_header.customerid = customer.customerid
        left join employee on order_header.salespersonid = employee.businessentityid
        left join person_address on order_header.billtoaddressid = person_address.addressid
        left join reason on order_header.salesorderid = reason.salesorderid
    )
    , order_detail_with_sk as (
        select
            order_detail.salesorderid
            , row_number() over (order by salesorderdetailid) as salesorderdetail_sk
            
            , product.product_sk as product_fk
            , order_detail.orderqty
            , order_detail.unitprice
            , order_detail.unitpricediscount

        from {{ ref('stg_salesorderdetail')}} as order_detail
        inner join product on order_detail.productid = product.productid
    )
    , final as (
        select distinct
            order_detail_with_sk.salesorderid
            , order_detail_with_sk.salesorderdetail_sk as salesorderdetail_fk
            , order_header_with_sk.creditcard_fk
            , order_header_with_sk.customer_fk
            , order_header_with_sk.salesperson_fk
            , order_header_with_sk.personaddress_fk
            , order_header_with_sk.salesorder_fk
            , order_detail_with_sk.product_fk
            , order_detail_with_sk.orderqty
            , order_detail_with_sk.unitprice
            , order_detail_with_sk.unitpricediscount
            , order_header_with_sk.subtotal
            , order_header_with_sk.taxamt
            , order_header_with_sk.freight
            , order_header_with_sk.totaldue
            , order_header_with_sk.order_status
            , order_header_with_sk.orderdate
            , order_header_with_sk.duedate
            , order_header_with_sk.shipdate
            
        from order_header_with_sk
        inner join order_detail_with_sk on order_header_with_sk.salesorderid = order_detail_with_sk.salesorderid
    )

select * from final