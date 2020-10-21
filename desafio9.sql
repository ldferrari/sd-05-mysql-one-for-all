DELIMITER $$
CREATE PROCEDURE albuns_do_artista (
	IN artista VARCHAR(50))
BEGIN
	SELECT art.artista_nome AS artista, alb.album_nome AS album
    FROM SpotifyClone.artista AS art
    INNER JOIN SpotifyClone.album AS alb ON (art.artista_id = alb.artista_id)
    WHERE art.artista_nome = artista
    ORDER BY 2;    
END $$
DELIMITER ;
