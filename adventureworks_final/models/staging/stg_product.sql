with
    source as (
        select
            /* Primary Key */
            productid
            
            /* Foreign Key */
            , productsubcategoryid
            , productmodelid

            , productnumber
            , product.name as product_name
            , product.color as product_color
            , standardcost
            , listprice
            , product.size as product_size
            , product.weight as product_weight
            , productline
            , class
            , style
            , safetystocklevel
            , reorderpoint
            , daystomanufacture
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , sellstartdate
            , sellenddate
            , discontinueddate
            , makeflag
            , finishedgoodsflag
            , rowguid
            , modifieddate
   
        from {{ source('final_dw','product')}}
    )

select * from source