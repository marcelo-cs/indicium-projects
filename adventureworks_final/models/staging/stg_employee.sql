with
    source as (
        select
            /* Primary Key */
            businessentityid	
		
            , nationalidnumber
            , loginid
            , jobtitle
            , gender
            , maritalstatus
            , birthdate
            , hiredate
            , vacationhours
            , sickleavehours
            , currentflag
            , salariedflag
            , organizationnode
            , rowguid
            , modifieddate
            
        from {{ source('final_dw','employee')}}
    )

select * from source