-- CASO 1 LISTADO DE TRABAJADORES
SELECT 
UPPER(t.nombre || ' ' || t.appaterno || ' ' || t.apmaterno) AS "Nombre Completo Trabajador",
TO_CHAR(t.numrut, '99G999G999') || '-' || t.dvrut AS "RUT Trabajador",
tt.desc_categoria AS "Tipo Trabajador",
UPPER(cc.nombre_ciudad) AS "Ciudad Trabajador",
TO_CHAR(t.sueldo_base, '$99G999G999') AS "Sueldo Base"
FROM trabajador t
INNER JOIN tipo_trabajador tt ON t.id_categoria_t = tp.id_categoria
INNER JOIN comuna_ciudad cc USING (id_ciudad)
WHERE t.sueldo_base BETWEEN 650000 AND 3000000
ORDER BY cc.nombre_ciudad DESC, t.sueldo_base ASC;

-- CASO 2 LISTADO CAJEROS

SELECT 
    TO_CHAR(t.numrut, '99G999G999') || '-' || t.dvrut AS "RUT Trabajador",
    INITCAP(t.nombre) || ' ' || UPPER(t.appaterno) AS "Nombre Trabajador",
    COUNT(tc.nro_ticket) AS "Total Tickets",
    TO_CHAR(SUM(tc.monto_ticket), '$99G999G999') AS " Total Vendido",
    TO_CHAR(SUM(ct.valor_comision), '$99G999G999') AS "Comisión Total",
    UPPER(tt.desc_categoria) AS "Tipo Trabajador",
    UPPER(c.nombre_ciudad) AS "Ciudad Trabajador"
FROM trabajador t
INNER JOIN tipo_trabajador tt
    ON t.id_categoria_t = tt.id_categoria
INNER JOIN comuna_ciudad c
    ON t.id_ciudad = c.id_ciudad
INNER JOIN tickets_concierto tc
    ON t.numrut = tc.numrut_t
INNER JOIN comisiones_ticket ct
    ON tc.nro_ticket = ct.nro_ticket
INNER JOIN afp a
    ON t.cod_afp = a.cod_afp
WHERE tt.desc_categoria = 'CAJERO'
GROUP BY 
    t.numrut, t.dvrut, t.nombre, t.appaterno,
    tt.desc_categoria, c.nombre_ciudad
HAVING SUM(tc.monto_ticket) > 50000
ORDER BY SUM(tc.monto_ticket) DESC;

-- CASO 3 LISTADO DE BONIFICACIONES

SELECT
    LPAD(TO_CHAR(t.numrut, '99G999G999'), 12) AS "RUT Trabajador",
    INITCAP(t.nombre || ' ' || t.appaterno) AS "Trabajador Nombre",
    EXTRACT(YEAR FROM t.fecing) AS "Año Ingreso",
    TRUNC(MONTHS_BETWEEN(SYSDATE, t.fecing)/12) AS "Años Antigüedad",
    COUNT(af.numrut_carga) AS "Num. Cargas Familiares",
    LPAD(INITCAP(i.nombre_isapre), 15) AS "Nombre Isapre",
    TO_CHAR(t.sueldo_base, '$999G999G999') AS "Sueldo Base",
    CASE
        WHEN UPPER(i.nombre_isapre) = 'FONASA' 
         THEN LPAD(TO_CHAR(ROUND(t.sueldo_base * 0.01, 0), 'FM$99G999G999'), 12)
         ELSE LPAD('0', 12)
    END AS "Bono Fonasa",
    TO_CHAR(
        CASE 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, t.fecing)/12)<= 10 THEN t.sueldo_base * 0.10
            ELSE t.sueldo_base * 0.15
        END, '$999G999G999') AS "Bono Antigüedad",
    INITCAP(a.nombre_afp) AS "Nombre AFP",
    UPPER(es.desc_estcivil) AS "Estado Civil"
FROM trabajador t
INNER JOIN isapre i
    ON t.cod_isapre = i.cod_isapre
INNER JOIN est_civil ec
    ON t.numrut = ec.numrut_t 
INNER JOIN estado_civil es
    ON ec.id_estcivil_est = es.id_estcivil
LEFT JOIN asignacion_familiar af
    ON t.numrut = af.numrut_t
INNER JOIN afp a
    ON t.cod_afp = a.cod_afp
WHERE ec.fecter_estcivil IS NULL
    OR ec.fecter_estcivil > SYSDATE
GROUP BY 
    t.numrut, t.dvrut, t.nombre, t.appaterno, t.apmaterno,
    t.fecing, t.sueldo_base, i.nombre_isapre, a.nombre_afp, es.desc_estcivil
ORDER BY LPAD(TO_CHAR(t.numrut, '99G999G999'), 12) ASC;


    
    

        
        


    
    
    

    
    
    