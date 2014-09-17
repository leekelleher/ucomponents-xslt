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

		<xsl:variable name="nodeId" select="1020" />
		<xsl:variable name="niceUrl" select="ucomponents.urls:NiceUrl($nodeId)" />

		<p>
			GetNodeIdByUrl:
			<xsl:value-of select="ucomponents.urls:GetNodeIdByUrl($niceUrl)"/>
		</p>

		<p>
			GetXmlNodeByUrl:
			<xmp>
				<xsl:copy-of select="ucomponents.urls:GetXmlNodeByUrl($niceUrl)"/>
			</xmp>
		</p>

		<p>
			GetHostName:
			<xsl:value-of select="ucomponents.urls:GetHostName($nodeId)"/>
		</p>

	</xsl:template>

</xsl:stylesheet>