-- Proporção de investimento para os candidatos eleitos vs proporção de investimento para candidatos não eleitos - queries:
-- Média de valor por candidato total
SELECT ROUND(AVG(valor_receita), 2) AS media_receita
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'

--Média de investimentos por candidato eleito
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de investimentos por candidato não eleito
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf


-- Média de valor investido por candidato eleito como deputado federal;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'deputado federal'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf


-- Média de valor investido por candidato não eleito como deputado federal;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'deputado federal'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf


-- Média de valor investido por candidato eleito como deputado estadual/municipal;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'deputado estadual'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato não eleito como deputado estadual/municipal;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'deputado estadual'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato eleito como senador;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'senador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato não eleito como senador;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'senador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato eleito como governador
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'governador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato não eleito como governador
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2022 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2022 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'governador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato eleito como prefeito;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2020 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'prefeito'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato não eleito como prefeito;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2020 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'prefeito'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf
-- Média de valor investido por candidato eleito como vereador;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('eleito por qp', 'eleito por media', 'eleito', '2º turno')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2020 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'vereador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf

-- Média de valor investido por candidato não eleito como vereador;
WITH resultado_eleicoes AS (SELECT id_candidato_bd AS id_candidato, ano, cargo
FROM basedosdados.br_tse_eleicoes.resultados_candidato 
WHERE ano = 2020 AND resultado IN ('nao eleito', 'suplente')),

receita_eleitos AS (SELECT receitas_candidato.*, resultado_eleicoes.*
FROM basedosdados.br_tse_eleicoes.receitas_candidato JOIN resultado_eleicoes ON resultado_eleicoes.id_candidato = receitas_candidato.id_candidato_bd
WHERE receitas_candidato.ano = 2020 AND origem_receita = 'recursos de pessoas fisicas' AND resultado_eleicoes.cargo = 'vereador'), 

sum_eleitos_cpf AS (SELECT cpf_candidato, SUM(valor_receita) AS valor_total
FROM receita_eleitos
GROUP BY 1)

SELECT ROUND(AVG(valor_total), 2) AS media_invest
FROM sum_eleitos_cpf
