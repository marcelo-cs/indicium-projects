with
    source as (
        select
            /* Primary Key */
            creditcardid
	
            , cardtype
            , cardnumber
            , expmonth
            , expyear
            , modifieddate

        from {{ source('final_dw','creditcard')}}
    )

select * from source