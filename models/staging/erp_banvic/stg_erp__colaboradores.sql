with
    fonte_colaboradores as (
        select *
        from {{ source('erp', 'colaboradores') }}
    )
    
    , renomeado as (
        select
            cod_colaborador as pk_cod_colaborador
            , cod_localidade as fk_localidade
            , primeiro_nome || ' ' || ultimo_nome as nome_colaborador
            , email as email_colaborador
            , regexp_replace(cpf, '[^a-zA-Z0-9]', '') as cpf_colaborador
            , cast(data_nascimento as date) as data_nascimento_colaborador
            , endereco as endereco_colaborador
            , regexp_replace(cep, '[^a-zA-Z0-9]', '') as cep_colaborador
            , cast(cod_gerente as int) as cod_gerente
        from fonte_colaboradores
    )

select *
from renomeado