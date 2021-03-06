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

;%HXITAB^INT^1^59547,73870^0
HXITAB(REPON,TIT) 
 
 
 
 
 N SNOCOL,BL,DX,DY,GLOBAL,TXT,%TERM,%PORT,DESC,XC,GL,HIS
 I $$INIT^%PBMHITX(.%TERM,.%PORT)=0 Q
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPRESSION.GRAPHIQUE") K @(GLOBAL)
 S TXT=$$CONCAS^%QZCHAD(GLOBAL,"TEXTE")
 S DESC=$$CONCAS^%QZCHAD(GLOBAL,"COL")
 S SNOCOL=NOCOL,XC=10
H1 
 S HIS=1,GL=HISTO1
 G:'($D(@GL@(NOCOL))) END
 D MKGRA^%HXIIST2(GL,HIS,OPTH),MKCOL^%HXIIST2(GL,HIS,OPTH),MKTEX^%HXIIST2(GL,HIS,OPTH)
 I TIT'="" S @TXT@(0,(112-$L(TIT))\2)=TIT
 S @TXT@(2,XC)=$$^%QZCHW("Liste")_" : "_@TEMP@("LISTE")
 S @TXT@(3,XC+4)=$S((CARD="")!(CARD=0):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 S @TXT@(4,XC)=$$^%QZCHW($S(OPTH=1:"Cumul",1:"Moyenne"))_" : "_TOT1
 S @TXT@(5,XC)=$$^%QZCHW("Sur")_"   : "_GR
 S DY=(HFHA+HHIST)+5,@TXT@(DY,XC)=$$^%QZCHW($S(OPTH=1:"Total col.",1:"Moyenne col."))
 S DY=DY+1
 S @TXT@(DY,XC)=$$^%QZCHW($S(OPTH=1:"Pourcentage",1:"Ecart type"))
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Nb individus")
 S DY=DY+2,@TXT@(DY,XC)=$$^%QZCHW($S(OPTH=1:"Total cumule",1:"Moyenne totale"))_" = "_$J(@GL@("TOTAL"),1,2)
 I $D(SSCUMUL) S DY=DY-1,@TXT@(DY,XC)=$$^%QZCHW($S(OPTH=1:"Total courant",1:"Ecart type total "))_" = "_SSCUMUL
 G IMP
 
H2 
 S HIS=2,GL=HISTO2
 I '($D(@GL@(NOCOL))) G SUITE
 D MKGRA^%HXIIST2(GL,HIS,OPTH2),MKCOL^%HXIIST2(GL,HIS,OPTH2),MKTEX^%HXIIST2(GL,HIS,OPTH2)
 S DX=LMARG(2)+8
 I $D(@GL@("DATE")) S @TXT@(2,DX)=$$^%QZCHW("Date")_" : "_@GL@("DATE")
 S @TXT@(4,DX)=$$^%QZCHW($S(OPTH2=1:"Cumul",1:"Moyenne"))_" : "_TOT2
 S @TXT@(5,DX)=$$^%QZCHW("Sur")_"   : "_GR
 S DY=(HFHA+HHIST)+5
 S @TXT@(DY,DX)=$$^%QZCHW($S(OPTH2=1:"Total col.",1:"Moyenne col."))
 S DY=DY+1,@TXT@(DY,DX)=$$^%QZCHW($S(OPTH2=1:"Pourcentage",1:"Ecart type"))
 S DY=DY+1,@TXT@(DY,DX)=$$^%QZCHW("Nb individus")
 S DY=DY+2,@TXT@(DY,DX)=$$^%QZCHW($S(OPTH2=1:"Total cumule",1:"Moyenne totale"))_" = "_$J(@GL@("TOTAL"),1,2)
 I $D(SSCUMUL) S DY=DY-1,@TXT@(DY,DX)=$$^%QZCHW($S(OPTH2=1:"Total courant",1:"Ecart type total "))_" = "_SSCUMUL
 G IMP
 
IMP 
 S DY="",DX=$S(HIS=1:XC,1:LMARG(2)+7)
 F I=0:0 S DY=$O(@TEXT2@(HIS,1,DY)) Q:DY=""  S @TXT@((DY+HTEXT)+2,DX)=@TEXT2@(HIS,1,DY)
 
 S DX=(((LMARG(HIS)+((1+HIS)*XC))-5)-LARG)-ECART
 F I=1:1 Q:'($D(@TEXT@(HIS,I)))  S DX=(DX+LARG)+ECART F DY=1:1:4 S @TXT@(((DY+HHIST)+HFHA)+3,DX)=$E(@TEXT@(HIS,I,DY),1,LARG)
 
 F DX=1:1:4 S DY="" F I=0:0 S DY=$O(@COLON@(HIS,DX,DY)) Q:DY=""  S @DESC@(DY+1,DX)=@COLON@(HIS,DX,DY)
 
 S @GLOBAL@("PAR","X")=(LMARG(HIS)+((1+HIS)*XC))-5,@GLOBAL@("PAR","Y")=(HFHA+2)+1
 S @GLOBAL@("PAR","H")=HHIST,@GLOBAL@("PAR","L")=LHIST
 S @GLOBAL@("PAR","LC")=LARG,@GLOBAL@("PAR","E")=ECART
 S @GLOBAL@("PAR","HIS")=HIS
 
 
 
 I HIS=1 Q:'($$^%EDPRLG)
 S %FONC="HISTO" D ^%PBPZ
 I HIS=2 D FIN
 K @(GLOBAL)
 G:HIS=1 H2
 
SUITE G:REPON'="la totalite de l'histogramme" END
 
 S NOCOL=NOCOL+NBCOL
 G H1
 
END S NOCOL=SNOCOL
 Q
 
FIN S %FONC="STANDARD" D ^%PBPZ
 
 D ^%EDEPLG
 Q

