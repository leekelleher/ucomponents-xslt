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
			uComponents: Slider - An XSLT example
			=====================================
			The Slider data-type will provide a value with either a single number or 2 (comma-separated) numbers.
			Here will use an example of how to display both scenarios.
		-->
		
		<!-- First we check that the slider has a value -->
		<xsl:if test="$currentPage/slider != ''">
		
			<p>
			
				<!-- If so, then we can prefix the value(s) with a label -->
				<xsl:text>The price is </xsl:text>
				
				<xsl:choose>
					
					<!-- Check if value contains a comma - making the assumption there are 2 values -->
					<xsl:when test="contains($currentPage/slider, ',')">
						
						<!-- Use the umbraco.library to split the comma-separated values -->
						<xsl:variable name="sliderValues" select="umbraco.library:Split($currentPage/slider, ',')" />
						
						<xsl:text>between $</xsl:text>
						
						<xsl:value-of select="$sliderValues/value[1]"/>
						
						<xsl:text> and $</xsl:text>
						
						<xsl:value-of select="$sliderValues/value[2]"/>
					
					</xsl:when>
					
					<!-- Otherwise we assume that the value is a single number -->
					<xsl:otherwise>
						
						<xsl:text>$</xsl:text>
						
						<xsl:value-of select="$currentPage/slider" />
						
					</xsl:otherwise>
				</xsl:choose>
				
			</p>

			<!-- An alternative 'quick-n-dirty' soltion is to do a string replace on the comma -->
			<p>
				<xsl:text>The prices start from $</xsl:text>
				
				<xsl:value-of select="umbraco.library:Replace($currentPage/slider, ',', ' to $')" />
				
			</p>
			
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>