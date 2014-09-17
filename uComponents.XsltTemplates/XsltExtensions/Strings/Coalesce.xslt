<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.strings="urn:ucomponents.dates"
	exclude-result-prefixes="msxml umbraco.library ucomponents.strings">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<p>
			Coalesce (2 args - returns arg1): <xsl:value-of select="ucomponents.strings:Coalesce('arg1', 'arg2')"/>
		</p>

		<p>
			Coalesce (3 args - returns arg3): <xsl:value-of select="ucomponents.strings:Coalesce('', null, 'arg3')"/>
		</p>

		<p>
			Coalesce (4 args - returns arg4): <xsl:value-of select="ucomponents.strings:Coalesce('', '', '', 'arg4')"/>
		</p>

		<p>
			Coalesce (5 args - returns arg5): <xsl:value-of select="ucomponents.strings:Coalesce(null, '', '', '', 'arg5')"/>
		</p>

	</xsl:template>

</xsl:stylesheet>