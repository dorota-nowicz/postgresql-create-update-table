 -- Create table curvas
ALTER TABLE curvas 

-- add forwign key
ADD CONSTRAINT fk_punto FOREIGN KEY (fk_punto) REFERENCES puntoscontrol (id);

-- fill with random data
DO $$
BEGIN
   FOR counter IN 1..240 LOOP
   		DECLARE  
        _ids_array INTEGER[][];
        _id INTEGER;
   		fecha time :=  time '00:00' + counter * (time '00:10'); 
   		BEGIN
		FOR _id IN
     			 SELECT id FROM puntoscontrol
			LOOP
							INSERT into public.curvas (hora,imm,temez,fk_punto)
							VALUES
							( fecha , random()*(25-1)+10 ,random()*(25-1)+10,_id);
			END LOOP;
		END;
		
   END LOOP;
END; $$
