with
    selected as (
        select
            creditcardid
            , cardtype
   
        from {{ ref('stg_creditcard')}}
    )
    , transformed as (
        select
        /* create new surrogate key*/
            row_number() over (order by creditcardid) as creditcard_sk
            , *
        from selected
    )

select * 
from transformed