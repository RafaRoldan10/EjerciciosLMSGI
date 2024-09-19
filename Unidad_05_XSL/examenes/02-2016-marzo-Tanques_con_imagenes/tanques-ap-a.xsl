﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/juegoTanques">
    <html>
      <head>
        <title>Juego tanques</title>
        <style type="text/css">
          th {
            background: blue;
            color: white;
          }
          img {
            width: 50px;
          }
        </style>
      </head>
      <body>
      	<table border="1" width="80%" align="center">
      	  <tr>
      	    <th>Jugada</th>
      	    <th colspan="2">Tanque</th>
      	    <th>Descripción</th>
      	  </tr>
      	  <xsl:for-each select="jugadasDescritas/jugada">
      	    <tr>
      	      <xsl:if test="position() mod 2 = 1">
      	        <xsl:attribute name="style">
      	          background: lightblue;
      	        </xsl:attribute>
      	      </xsl:if>
      	      <td><xsl:value-of select="position()"/></td>
      	      <td><xsl:value-of select="@jugador"/></td>
      	      <td>
      	        <xsl:call-template name="imagenTanque">
      	         <xsl:with-param name="jugador"><xsl:value-of select="@jugador"/></xsl:with-param>
      	        </xsl:call-template>
      	      </td>
      	      <td><xsl:value-of select="@desc"/></td>
      	    </tr>
      	  </xsl:for-each>
      	</table>
      </body>
    </html>
  </xsl:template>
  
  
  <xsl:template name="imagenTanque">
    <xsl:param name="jugador"/>
<!--    <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
      <xsl:if test="@jugador = $jugador">
        <img src="{.}"/>
      </xsl:if>  
    </xsl:for-each>  -->
    <img src="{/juegoTanques/tanques/imagenTanque[@jugador=$jugador]}"/>
  </xsl:template>
</xsl:stylesheet>







