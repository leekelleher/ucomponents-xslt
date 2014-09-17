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

		<p>
			FormatDateTime (Regular): <xsl:value-of select="ucomponents.dates:FormatDateTime('2010-09-21', 'dd MMMM yyyy')"/>
		</p>

		<p>
			FormatDateTime (With suffix): <xsl:value-of select="ucomponents.dates:FormatDateTime('2010-09-22', 'ddS MMMM yyyy')"/>
		</p>

		<p>
			FormatDateTime (Escaped suffix token): <xsl:value-of select="ucomponents.dates:FormatDateTime('2010-09-23', 'dd\S MMMM yyyy')"/>
		</p>

	</xsl:template>

</xsl:stylesheet>