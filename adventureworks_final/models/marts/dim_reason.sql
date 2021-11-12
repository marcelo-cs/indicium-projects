with
    headersales_reason as (
        select *
        from {{ ref('stg_salesorderheadersalesreason')}} as headersales_reason
    )
    , sales_reason as (
        select *
        from {{ ref('stg_salesreason')}} as sales_reason
    )
    , transformed as (
        select
            /* create new surrogate key*/
            row_number() over (order by salesorderid) as salesorder_sk
            , headersales_reason.salesorderid
            , sales_reason.salesreasonid
            , sales_reason.salesreason_name
            , sales_reason.reasontype

        from headersales_reason
        left join sales_reason on headersales_reason.salesreasonid = sales_reason.salesreasonid
    )
select * 
from transformed