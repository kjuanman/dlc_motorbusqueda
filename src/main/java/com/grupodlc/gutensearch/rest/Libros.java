package com.grupodlc.gutensearch.rest;

import com.grupodlc.gutensearch.bll.Buscador;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/libros")
public class Libros {

	@GET
	@Path("buscar/{palabra}")
	@Produces("application/json")
	public Response buscarPalabra (
			@PathParam("palabra") String palabra)
	{

		Buscador b = new Buscador();
		List<String[]> documentosRelevantes = b.buscar(palabra);

		if (!documentosRelevantes.isEmpty())
			return Response.ok(documentosRelevantes.toArray()).build();
		else
			return Response.status(Response.Status.NOT_ACCEPTABLE).build();
	}
}
