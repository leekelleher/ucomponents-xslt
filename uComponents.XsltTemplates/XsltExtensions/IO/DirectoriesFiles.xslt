<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library"
	xmlns:ucomponents.io="urn:ucomponents.io"
	exclude-result-prefixes="msxml umbraco.library ucomponents.io">
	<xsl:output method="xml" omit-xml-declaration="yes"/>

	<xsl:param name="currentPage"/>

	<xsl:template match="/">

		<xsl:variable name="path" select="string('~/umbraco')" />
		<p>
			Path: <xsl:value-of select="$path"/>
		</p>

		<xsl:variable name="serverPath" select="ucomponents.io:GetServerMapPath($path)" />
		<p>
			Server Path: <xsl:value-of select="$serverPath"/>
		</p>

		<p>
			Directory Exists?
			<xsl:value-of select="ucomponents.io:DirectoryExists($serverPath)" />
		</p>

		<xsl:variable name="directories" select="ucomponents.io:GetDirectories($serverPath, '*', true())" />
		<p>
			Directory Listing:
			<ul>
				<xsl:for-each select="$directories/Directory">
					<li>
						<xsl:value-of select="." />
					</li>
				</xsl:for-each>
			</ul>
		</p>

		<p>
			List the Files in the last folder:
			<strong>
				<xsl:value-of select="$directories/Directory[last()]"/>
			</strong>
			<ul>
				<xsl:for-each select="ucomponents.io:GetFiles($directories/Directory[last()], '*.*', false())/File">
					<li>
						<xsl:value-of select="." />
					</li>
				</xsl:for-each>
			</ul>
		</p>

		<p>
			Does the file "~/App_Data/umbraco.config" exist?
			<strong>
				<xsl:value-of select="ucomponents.io:FileExists(ucomponents.io:GetServerMapPath('~/App_Data/umbraco.config'))" />
			</strong>
		</p>

	</xsl:template>

</xsl:stylesheet>