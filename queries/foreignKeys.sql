ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_13 FOREIGN KEY (HIPERTENSION) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_14 FOREIGN KEY (OTRA_COM) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_15 FOREIGN KEY (CARDIOVASCULAR) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_16 FOREIGN KEY (OBESIDAD) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_17 FOREIGN KEY (RENAL_CRONICA) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_18 FOREIGN KEY (TABAQUISMO) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_19 FOREIGN KEY (OTRO_CASO) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_20 FOREIGN KEY (TOMA_MUESTRA_LAB) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_21 FOREIGN KEY (TOMA_MUESTRA_ANTIGENO) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_22 FOREIGN KEY (MIGRANTE) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT COVID19MEXICO2021_FK_23 FOREIGN KEY (UCI) REFERENCES covid.Respuestas(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT RESLAB_FK FOREIGN KEY (RESULTADO_LAB) REFERENCES covid.ResultadoLab(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT RESANT_FK FOREIGN KEY (RESULTADO_ANTIGENO) REFERENCES covid.ResultadoAnt(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT CLASIF_FK FOREIGN KEY (CLASIFICACION_FINAL) REFERENCES covid.ClasificacionFinal(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT ENTIDAD_FK1 FOREIGN KEY (ENTIDAD_UM) REFERENCES covid.Entidad(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT ENTIDAD_FK2 FOREIGN KEY (ENTIDAD_NAC) REFERENCES covid.Entidad(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT ENTIDAD_FK3 FOREIGN KEY (ENTIDAD_RES) REFERENCES covid.Entidad(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT SECTOR_FK FOREIGN KEY (SECTOR) REFERENCES covid.Sector(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT SEXO_FK FOREIGN KEY (SEXO) REFERENCES covid.Sexo(CLAVE);
ALTER TABLE covid.COVID19MEXICO2021 ADD CONSTRAINT TIPO_FK FOREIGN KEY (TIPO_PACIENTE) REFERENCES covid.Tipo(CLAVE);