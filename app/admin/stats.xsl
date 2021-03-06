<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" />

  <xsl:include href="../includes/header.xsl"/>
  <xsl:include href="../includes/footer.xsl"/>
  <xsl:include href="../includes/navbar.xsl"/>

  <xsl:template match="/icestats">
    <html>
      <xsl:call-template name="header">
        <xsl:with-param name="title">Administration</xsl:with-param>
      </xsl:call-template>

      <body>
        <xsl:call-template name="navbar" />

        <main class="container" role="main">
          <h2>Administration</h2>

          <h3>Global server stats</h3>

          <table class="table">
            <thead>
              <tr>
                <th>Key</th>
                <th>Value</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="/icestats/*[not(self::source) and not(self::authentication)]">
                <tr>
                  <td><xsl:value-of select="name()" /></td>
                  <td><xsl:value-of select="text()" /></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <xsl:for-each select="source">
            <h3>Mountpoint <xsl:value-of select="@mount" /></h3>

            <h4>Play stream</h4>
            <a href="{@mount}.m3u"><i class="ion-play"></i> M3U</a>

            <h4>Further information</h4>
            <table class="table">
              <thead>
                <tr>
                  <th>Key</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="*[not(self::metadata) and not(self::authentication) and not(self::authenticator) and not(self::listener)]">
                  <tr>
                    <td><xsl:value-of select="name()" /></td>
                    <td><xsl:value-of select="text()" /></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>

            <xsl:if test="metadata/*">
              <h4>Extra Metadata</h4>
              <table class="table">
                <tbody>
                  <xsl:for-each select="metadata/*">
                    <tr>
                      <td><xsl:value-of select="name()" /></td>
                      <td><xsl:value-of select="text()" /></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
          </xsl:for-each>
        </main>

        <xsl:call-template name="footer" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
