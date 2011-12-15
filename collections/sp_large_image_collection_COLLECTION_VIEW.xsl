<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:php="http://php.net/xsl" xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="php" version="1.0">
  
  <xsl:variable name="BASEURL">
    <xsl:value-of select="$baseUrl"></xsl:value-of>
  </xsl:variable>
  <xsl:variable name="PATH">
    <xsl:value-of select="$path"></xsl:value-of>
  </xsl:variable>
  <xsl:variable name="thisPid" select="$collectionPid"></xsl:variable>
  <xsl:variable name="size" select="20"></xsl:variable>
  <xsl:variable name="page" select="$hitPage"></xsl:variable>
  <xsl:variable name="start" select="((number($page) - 1) * number($size)) + 1"></xsl:variable>
  <xsl:variable name="end" select="($start - 1) + number($size)"></xsl:variable>
  <xsl:variable name="cellsPerRow" select="4"></xsl:variable>
  <xsl:variable name="count" select="count(s:sparql/s:results/s:result)"></xsl:variable>
  <xsl:template match="/">
    <xsl:if test="$count&gt;0">
      <table cellpadding="3" cellspacing="3" width="90%">
        <tr>
          <td colspan="{$cellsPerRow}">
            
            
            <div class="item-list">
              <ul class="pager">
                <xsl:choose>
                  <xsl:when test="$end &gt;= $count and $start = 1">
                    <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$count"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
                  </xsl:when>
                  <xsl:when test="$end &gt;= $count">
                    <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$count"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
                    <li class="pager-previous">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page - 1"></xsl:value-of>
                        </xsl:attribute>
      &lt;Prev
     </a>
                    </li>
                  </xsl:when>
                  <xsl:when test="$start = 1">
                    <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$end"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
                    <li class="pager-next">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page + 1"></xsl:value-of>
                        </xsl:attribute>
      Next&gt;
     </a>
                    </li>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$end"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
                    <li class="pager-previous">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page - 1"></xsl:value-of>
                        </xsl:attribute>
      &lt;Prev
     </a> </li>
                    <li class="pager-next">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page + 1"></xsl:value-of>
                        </xsl:attribute>
      Next&gt;
     </a>
                    </li>
                  </xsl:otherwise>
                </xsl:choose>
              </ul>
            </div>
            
            <br clear="all"></br>
          </td>
        </tr>
        
        <xsl:apply-templates select="s:sparql/s:results"></xsl:apply-templates>
      </table>
      <br clear="all"></br>
      
      <div class="item-list">
        <ul class="pager">
          <xsl:choose>
            <xsl:when test="$end &gt;= $count and $start = 1">
              <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$count"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
            </xsl:when>
            <xsl:when test="$end &gt;= $count">
              <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$count"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
              <li class="pager-previous">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page - 1"></xsl:value-of>
                  </xsl:attribute>
      &lt;Prev
     </a>
              </li>
            </xsl:when>
            <xsl:when test="$start = 1">
              <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$end"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
              <li class="pager-next">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page + 1"></xsl:value-of>
                  </xsl:attribute>
      Next&gt;
     </a>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$start"></xsl:value-of>-<xsl:value-of select="$end"></xsl:value-of>
     of <xsl:value-of select="$count"></xsl:value-of> <br></br>
              <li class="pager-previous">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page - 1"></xsl:value-of>
                  </xsl:attribute>
      &lt;Prev
     </a> </li>
              <li class="pager-next">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$thisPid"></xsl:value-of>/-/Collection/<xsl:value-of select="$page + 1"></xsl:value-of>
                  </xsl:attribute>
      Next&gt;
     </a>
              </li>
            </xsl:otherwise>
          </xsl:choose>
        </ul>
      </div>
      
    </xsl:if>
  </xsl:template>
  <xsl:template match="s:sparql/s:results">
    <xsl:for-each select="s:result[position() mod $cellsPerRow = 1 and position()&gt;=$start and position() &lt;=$end]">
      <tr>
        <xsl:apply-templates select=". | following-sibling::s:result[position() &lt; $cellsPerRow]"></xsl:apply-templates>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="s:result">
    <xsl:variable name="OBJECTURI" select="s:object/@uri"></xsl:variable>
    <xsl:variable name="CONTENTURI" select="s:content/@uri"></xsl:variable>
    <xsl:variable name="CONTENTMODEL" select="substring-after($CONTENTURI,&apos;/&apos;)"></xsl:variable>
    <xsl:variable name="PID" select="substring-after($OBJECTURI,&apos;/&apos;)"></xsl:variable>
    <xsl:variable name="newTitle">
      <xsl:call-template name="replace-string">
        <xsl:with-param name="text" select="s:title"></xsl:with-param>
        <xsl:with-param name="from" select="&apos;_&apos;"></xsl:with-param>
        <xsl:with-param name="to" select="&apos; &apos;"></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="cleanTitle">
      <xsl:value-of select="php:functionString(&apos;fedora_repository_urlencode_string&apos;, $newTitle)"></xsl:value-of>
    </xsl:variable>
    <xsl:variable name="linkUrl">
      <xsl:choose>
        <xsl:when test="($CONTENTMODEL=&apos;islandora:collectionCModel&apos;)">
          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:copy-of select="$PID"></xsl:copy-of>/-/<xsl:value-of select="&apos;collection&apos;"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          
          <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:copy-of select="$PID"></xsl:copy-of>/-/<xsl:value-of select="$cleanTitle"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="s:content"></xsl:value-of>
    </xsl:variable>
    <td valign="top" width="25%">
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="$linkUrl"></xsl:value-of>
        </xsl:attribute>
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="$BASEURL"></xsl:value-of>/fedora/repository/<xsl:value-of select="$PID"></xsl:value-of>/TN
    </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of disable-output-escaping="yes" select="$newTitle"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
      <br clear="all"></br>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="$linkUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of disable-output-escaping="yes" select="$newTitle"></xsl:value-of>
      </a>
      
    </td>
    <xsl:if test="(position() = last()) and (position() &lt; $cellsPerRow)">
      <xsl:call-template name="FillerCells">
        <xsl:with-param name="cellCount" select="$cellsPerRow - position()"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="FillerCells">
    <xsl:param name="cellCount"></xsl:param>
    <td> </td>
    <xsl:if test="$cellCount &gt; 1">
      <xsl:call-template name="FillerCells">
        <xsl:with-param name="cellCount" select="$cellCount - 1"></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="replace-string">
    <xsl:param name="text"></xsl:param>
    <xsl:param name="from"></xsl:param>
    <xsl:param name="to"></xsl:param>
    <xsl:choose>
      <xsl:when test="contains($text, $from)">
        <xsl:variable name="before" select="substring-before($text, $from)"></xsl:variable>
        <xsl:variable name="after" select="substring-after($text, $from)"></xsl:variable>
        <xsl:variable name="prefix" select="concat($before, $to)"></xsl:variable>
        <xsl:value-of select="$before"></xsl:value-of>
        <xsl:value-of select="$to"></xsl:value-of>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text" select="$after"></xsl:with-param>
          <xsl:with-param name="from" select="$from"></xsl:with-param>
          <xsl:with-param name="to" select="$to"></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"></xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>