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
			AppendOrUpdateQueryString (Append query string to current url): <xsl:value-of select="ucomponents.urls:AppendOrUpdateQueryString('key', 'value')"/>
		</p>

		<p>
			AppendOrUpdateQueryString (Append query string to supplied url): <xsl:value-of select="ucomponents.urls:AppendOrUpdateQueryString('/test.aspx', 'key', 'value')"/>
		</p>

		<p>
			AppendOrUpdateQueryString (Update query string on supplied url): <xsl:value-of select="ucomponents.urls:AppendOrUpdateQueryString('/test.aspx?key=value', 'key', 'value2')"/>
		</p>

		<p>
			AppendOrUpdateQueryString (Update complex query string on supplied url): <xsl:value-of select="ucomponents.urls:AppendOrUpdateQueryString('/test.aspx?key1=1&amp;key2=2&amp;key3=3', 'key2', '4')"/>
		</p>

	</xsl:template>

</xsl:stylesheet>