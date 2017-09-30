;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%HXYPAIG^INT^1^59547,73870^0
HXYPAIG(REPON,RIMP,XC) 
 
 
 
 
 
 
 
 
 
 
 N DX,DY,GLOBAL,TXT,%TERM,%PORT,DESC
 I $$INIT^%PBMHITX(.%TERM,.%PORT)=0 Q
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPRESSION.GRAPHIQUE") K @(GLOBAL)
 S TXT=$$CONCAS^%QZCHAD(GLOBAL,"TEXTE")
 S DESC=$$CONCAS^%QZCHAD(GLOBAL,"COL")
DEB1 
 I RIMP'="" D @(RIMP_"(""G"")")
 D GRA,TEXT,COL,PAR
 
 
 
 
 Q:'($$^%EDPRLG)
 S %FONC="HISTO" D ^%PBPZ
 S %FONC="STANDARD" D ^%PBPZ
 
 
 D ^%EDEPLG K @(GLOBAL)
SUITE I REPON'="la totalite de l'histogramme" Q
 
 S NOCOL=NOCOL+NBCOL Q:'($D(@HISTO@(NOCOL)))
 D MKCOL^%HXYIST2,MKTEX^%HXYPARA G DEB1
 
GRA 
 S DX=XC,DY="" F I=0:0 S DY=$O(@TEXT2@(1,DY)) Q:DY=""  S @TXT@(DY+HTEXT,DX)=@TEXT2@(1,DY)
 Q
 
TEXT 
 N N
 S N=$P(@TEXT,"^",2)
 S DX=(((LMARG+XC)+5)-ECART)-LARG
 F I=1:1 Q:'($D(@TEXT@(I)))  S DX=(DX+LARG)+ECART F DY=1:1:N S @TXT@(((DY+HHIST)+HFHA)+2,DX)=$E(@TEXT@(I,DY),1,LARG)
 Q
 
COL 
 F DX=1:1:4 S DY="" F I=0:0 S DY=$O(@COLON@(DX,DY)) Q:DY=""  S @DESC@(DY,DX)=@COLON@(DX,DY)
 Q
 
PAR 
 S @GLOBAL@("PAR","X")=(LMARG+XC)+5,@GLOBAL@("PAR","Y")=HFHA+2
 S @GLOBAL@("PAR","H")=HHIST,@GLOBAL@("PAR","L")=LHIST
 S @GLOBAL@("PAR","LC")=LARG,@GLOBAL@("PAR","E")=ECART,@GLOBAL@("PAR","HIS")=1
 Q

