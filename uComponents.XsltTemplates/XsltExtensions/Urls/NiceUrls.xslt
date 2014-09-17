<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.urls="urn:ucomponents.urls"
	exclude-result-prefixes="msxml umbraco.library ucomponents.urls">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<p>
			NiceUrl (Standard): <xsl:value-of select="ucomponents.urls:NiceUrl(1020)"/>
		</p>

		<p>
			NiceUrl (Including alt template as path): <xsl:value-of select="ucomponents.urls:NiceUrl(1020, 'altTemplateAlias')"/>
		</p>

		<p>
			NiceUrl (Including alt template as query string): <xsl:value-of select="ucomponents.urls:NiceUrl(2010, 'altTemplateAlias', true())"/>
		</p>

	</xsl:template>

</xsl:stylesheet>