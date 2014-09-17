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
			uComponents: Multi-node Tree Picker - An XSLT example
			=====================================
			The Multi-node Tree Picker data-type will provide XML data based on the nodes you have selected.
			In this example, the property alias name for the Multi-node Tree Picker is "treePicker".
		-->

		<!-- First we check that the Multi-node Tree Picker has any nodeId values -->
		<xsl:if test="$currentPage/treePicker/MultiNodePicker/nodeId">

			<ul>

				<!-- Loop through each of the nodeId values -->
				<xsl:for-each select="$currentPage/treePicker/MultiNodePicker/nodeId">

					<!-- Since we only have the nodeId value, we need to get the actual content node using umbraco.library's GetXmlNodeById method -->
					<xsl:variable name="node" select="umbraco.library:GetXmlNodeById(.)" />

					<!-- If you prefer to use pure XPath, then used this: "$currentPage/ancestor-or-self::*[@isDoc and @level = 1]/descendant-or-self::*[@isDoc and @id = current()]" -->
					<li>

						<!-- Output the URL using umbraco.library's NiceUrl method -->
						<a href="{umbraco.library:NiceUrl(.)}">

							<xsl:value-of select="$node/@nodeName" />

						</a>

					</li>

				</xsl:for-each>

			</ul>

		</xsl:if>


		<!--
			An example using Multi-node Tree Picker with CSV data.
		-->

		<!-- Check if the 'treePicker' has a value -->
		<xsl:if test="$currentPage/treePicker != ''">

			<!-- Using the umbraco.library function Split, we store the values to a variable -->
			<xsl:variable name="nodeIds" select="umbraco.library:Split($currentPage/treePicker, ',')" />

			<!-- Check if the variable has any values -->
			<xsl:if test="$nodeIds/value">

				<ul>

					<!-- Loop through the values using an xsl:for-each (as above) -->

					<!-- An alternative approach would be to use xsl:apply-templates -->
					<xsl:apply-templates select="$nodeIds/value" />

				</ul>

			</xsl:if>

		</xsl:if>

	</xsl:template>

	<!-- An example of using xsl:template, as opposed to xsl:for-each loops -->
	<xsl:template match="nodeId | value">

		<!-- Since we only have the nodeId value, we need to get the actual content node using umbraco.library's GetXmlNodeById method -->
		<xsl:variable name="node" select="umbraco.library:GetXmlNodeById(.)" />

		<!-- If you prefer to use pure XPath, then used this: "$currentPage/ancestor-or-self::*[@isDoc and @level = 1]/descendant-or-self::*[@isDoc and @id = current()]" -->
		<li>

			<!-- Output the URL using umbraco.library's NiceUrl method -->
			<a href="{umbraco.library:NiceUrl(.)}">

				<xsl:value-of select="$node/@nodeName" />

			</a>

		</li>

	</xsl:template>

</xsl:stylesheet>