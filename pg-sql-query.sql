CREATE TABLE IF NOT EXISTS curvas (
  id serial,
  fk_puntoscontrol INTEGER,
  fechahora timestamp without time zone  NOT NULL,  
  imm real NOT NULL,  
  temez real NOT NULL);


ALTER TABLE curvas 
ADD CONSTRAINT fk_puntoscontrol FOREIGN KEY (fk_puntoscontrol) REFERENCES puntoscontrol (id);


DO $$
BEGIN
   FOR counter IN 1..5 LOOP
   		DECLARE  
		intervalo VARCHAR(50) := CONCAT(CAST(counter AS text),' hour');
   		fecha timestamp :=  timestamp '2019-10-27 00:00:00' + intervalo ::interval;
		i record; 
   		BEGIN
		
		
			FOR i IN  select id from puntoscontrol
						LOOP
							INSERT into public.curvas (fechahora,imm,temez,fk_puntoscontrol)
							VALUES
							( fecha , random()*(25-1)+counter,random()*(25-1)+counter ,i.id);
			END LOOP;
		END;
		
   END LOOP;
END; $$
