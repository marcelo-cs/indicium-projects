with
    source as (
        select
            /* Primary Key */
            salesorderid
            
            /* Foreign Key */
            , customerid
            , salespersonid
            , territoryid
            , billtoaddressid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            , currencyrateid

            , revisionnumber
            , purchaseordernumber
            , accountnumber
            , subtotal
            , taxamt
            , freight
            , totaldue
            , creditcardapprovalcode
            , orderdate
            , duedate
            , shipdate
            , salesorderheader.status as order_status
            , onlineorderflag
            , comment
            , rowguid
            , modifieddate

        from {{ source('final_dw','salesorderheader')}}
    )

select * from source