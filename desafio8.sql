USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.seguindo WHERE usuario_id = OLD.usuario_id;
END; $$
DELIMITER ;
