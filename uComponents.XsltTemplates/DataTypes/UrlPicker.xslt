<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	exclude-result-prefixes="msxml umbraco.library">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<!--
			uComponents: UrlPicker - An XSLT example
			=====================================
			The UrlPicker data-type provides a way to select where a URL points to,
			whether that be a content node, media node, uploaded file or external URL.
			
			The following XML is produced:
			
			<url-picker mode="URL">
				<new-window>True</new-window>
				<node-id></node-id>
				<url>http://our.umbraco.org</url>
			</url-picker>
		-->

		<!-- Check that the UrlPicker has a node-set -->
		<xsl:if test="$currentPage/urlPicker/url-picker">

			<!-- Store the XML data in a variable -->
			<xsl:variable name="urlXml" select="currentPage/urlPicker/url-picker" />

			<a>
				<xsl:attribute name="href">
					<!-- Test which methid is selected -->
					<xsl:choose>
						<xsl:when test="$urlXml/@mode = 'URL'">
							<xsl:value-of select="$urlXml/url" />
						</xsl:when>
						<xsl:when test="$urlXml/@mode= 'Content'">
							<xsl:value-of select="umbraco.library:NiceUrl($urlXml/node-id)" />
						</xsl:when>
						<xsl:when test="$urlXml/@mode = 'Media'">
							<xsl:value-of select="umbraco.library:GetMedia($urlXml/node-id, false())/umbracoFile" />
						</xsl:when>
						<xsl:when test="$urlXml/@mode = 'Upload'">
							<xsl:value-of select="$urlXml/url" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>#</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>

				<!-- Check if the 'new-window' option is enabled -->
				<xsl:if test="string($urlXml/new-window) = 'True'">
					<xsl:attribute name="target">_blank</xsl:attribute>
				</xsl:if>

				<!-- You can define your own link text here -->
				<xsl:text>[Your link text goes here.]</xsl:text>
				
				<!-- or even use the current page's name? -->
				<xsl:value-of select="$currentPage/@nodeName" />
				
			</a>

		</xsl:if>

	</xsl:template>

</xsl:stylesheet>