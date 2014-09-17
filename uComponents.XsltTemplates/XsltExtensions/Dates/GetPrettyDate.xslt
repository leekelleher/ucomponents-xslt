<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.dates="urn:ucomponents.dates"
	exclude-result-prefixes="msxml umbraco.library ucomponents.dates">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<h1>GetPrettyDate</h1>

		<dl>
			<xsl:for-each select="$currentPage/*[@nodeName]">
				<dt>
					<xsl:value-of select="@nodeName" />
				</dt>
				<dd>
					Last updated:
					<xsl:value-of select="ucomponents.dates:GetPrettyDate(@updateDate, 'ddS MMMM yyyy')" />
				</dd>
			</xsl:for-each>
		</dl>

	</xsl:template>

</xsl:stylesheet>