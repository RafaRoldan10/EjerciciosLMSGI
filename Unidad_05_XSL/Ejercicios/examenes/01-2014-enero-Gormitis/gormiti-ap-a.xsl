<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/gormitis">
    <html>
      <head>
        <title>Gormitis</title>
        <style type="text/css">
          th {
            background: #090f7d;
            color: #FFFFFF;
          }
          img {
            width: 50px;
          }
        </style>
      </head>
      <body>
      	<table width="50%" align="center">
      	  <tr>
      	    <th></th>
      	    <th>Gormiti</th>
      	    <th>Tribu</th>
      	  </tr>
      	  <xsl:call-template name="filasTabla"/>
      	</table>
      </body>
    </html>
  </xsl:template>
  
  <!-- -->
  <xsl:template name="filasTabla">
    <xsl:for-each select="gormiti">
      <tr>
        <xsl:if test="position() mod 2 = 1">
          <xsl:attribute name="style">background: #87adfa;</xsl:attribute>
        </xsl:if>
        <td><xsl:value-of select="position()"/></td>
        <td><img src="{.}"/></td>
        <td><xsl:value-of select="@tribu"/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>







