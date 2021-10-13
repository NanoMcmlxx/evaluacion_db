SELECT categorias.categoria, notas.titulo 
FROM notas, notas_por_categoria, categorias
WHERE notas.id=notas_por_categoria.nota_id
AND categorias.id=notas_por_categoria.categoria_id
ORDER BY categorias.categoria;

SELECT notas.titulo, categorias.categoria, categorias.id 
FROM notas, notas_por_categoria, categorias
WHERE notas.id=notas_por_categoria.nota_id
AND categorias.id=notas_por_categoria.categoria_id
ORDER BY notas.titulo;

SELECT notas.titulo, gestiones.gestion
FROM notas, gestiones
WHERE notas.gestion_id=gestiones.id;

