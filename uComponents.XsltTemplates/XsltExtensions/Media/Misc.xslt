<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.media="urn:ucomponents.media"
	exclude-result-prefixes="msxml umbraco.library ucomponents.media">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<p>
			GetImageHtml:
			<xsl:value-of select="ucomponents.media:GetImageHtml('1234')"/>
		</p>

		<p>
			GetMediaByCsv (string csv):
			<xmp>
				<xsl:copy-of select="ucomponents.media:GetMediaByCsv('1234,1235,1236')"/>
			</xmp>
		</p>

		<p>
			GetMediaByCsv (string csv, bool deep):
			<xsl:value-of select="ucomponents.media:GetMediaByCsv('1234,1235,1236', 1)"/>
		</p>

	</xsl:template>

</xsl:stylesheet>