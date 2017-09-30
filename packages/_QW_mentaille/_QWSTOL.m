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

;%QWSTOL^INT^1^59547,73886^0
QWSTOL ;
 
 
 
 
 
 
 
 
A1B(REP,IND,ATTRIB) G AUN
A1(ATTRIB) 
AUN N UNDEFVAR
 Q:'($D(@WWSTOCK@(REP,IND,ATTRIB))) UNDEFVAR
 Q @WWSTOCK@(REP,IND,ATTRIB,$O(@WWSTOCK@(REP,IND,ATTRIB,"")))
 
A2B(REP,IND,ATTRIB,ORD) G ADEUX
A2(ATTRIB,ORD) 
ADEUX Q @WWSTOCK@(REP,IND,ATTRIB,ORD)
 
B1(ATTRIB,LIEN,ORD) 
 N RJ,IJ,OJ,UNDEFVAR
 Q:'($D(@WWSTOCK@(REP,IND,LIEN))) UNDEFVAR
 S RJ=@WWLSTOCK@(LIEN,"D")
 S OJ=$S($D(ORD):ORD,1:$O(@WWSTOCK@(REP,IND,LIEN,"")))
 S IJ=@WWSTOCK@(REP,IND,LIEN,OJ)
 
 
 Q:'($D(@WWSTOCK@(RJ,IJ,ATTRIB))) UNDEFVAR
 Q @WWSTOCK@(RJ,IJ,ATTRIB,$O(@WWSTOCK@(RJ,IJ,ATTRIB,"")))
 
C(ATTRIB,ORDA,LIEN,ORD) 
 N RJ,IJ,OJ,UNDEFVAR
 Q:'($D(@WWSTOCK@(REP,IND,LIEN))) UNDEFVAR
 S RJ=$S($D(LIEN):@WWLSTOCK@(LIEN,"D"),1:REP)
 S OJ=$S($D(ORD):ORD,1:$O(@WWSTOCK@(REP,IND,LIEN,"")))
 S IJ=@WWSTOCK@(REP,IND,LIEN,ORD)
 Q @WWSTOCK@(RJ,IJ,ATTRIB,ORDA)
 
VALEUR(REP,IND,ATT) 
 N ORD
 S ORD=1 S:'($D(@WWSTOCK@(REP,IND,ATT,1))) ORD=$O(@WWSTOCK@(REP,IND,ATT,""))
 Q @WWSTOCK@(REP,IND,ATT,ORD)
 
 
 
 
EXIRI(REP,IND) 
 Q $D(@WWSTOCK@(REP,IND))=10
EXIRIA(REP,IND,ATT) 
 Q $D(@WWSTOCK@(REP,IND,ATT))=10
EXIRIAO(REP,IND,ATT,ORD) 
 Q $D(@WWSTOCK@(REP,IND,ATT,ORD))
 
 
 
 
LIND(REP) 
 Q $$CONCAS^%QZCHAD(WWSTOCK,REP)
LATT(REP,IND) 
 Q $$CONCAS^%QZCHAD(WWSTOCK,REP_","_IND)
 
NOML(REP,IND,LIEN,ORD,DEST) 
 I '($D(@WWLSTOCK@(LIEN,"F",IND,ORD,DEST))) Q ""
 Q @WWLSTOCK@(LIEN,"F",IND,ORD,DEST)
 
REPVID(REP) 
 Q $D(@WWSTOCK@(REP))<10
 
 
 
INIT 
 N %L,%S,GLB,MOD,D,DI,L,LI,S,SI
 
 K @(WWLSTOCK)
 S MOD=""""_$$MODEL^%QSMODEL_""""
 F GLB="^[QUI]RQSMDL2("_MOD_")","^[QUI]RQSMDL3("_MOD_")" S S="" F %S=0:0 S S=$O(@GLB@(S)) Q:S=""  S L="" F %L=0:0 S L=$O(@GLB@(S,L)) Q:L=""  S D=$P(@GLB@(S,L),"^"),LI=$P(@GLB@(S,L),"^",2) D LIEN
 S GLB="^[QUI]RQSMDL4("_MOD_")"
 S S=""
 F %S=0:0 S S=$O(@GLB@(S)) Q:S=""  S L="",D=S F %L=0:0 S L=$O(@GLB@(S,L)) Q:L=""  S LI=$P(@GLB@(S,L),"^") D LIEN
 Q
LIEN S SI=$$NOMINT^%QSF(S),DI=$$NOMINT^%QSF(D)
 S @WWLSTOCK@(L,"C")=100000,@WWLSTOCK@(L,"D")=DI,@WWLSTOCK@(L,"I")=LI,@WWLSTOCK@(L,"S")=SI
 S @WWLSTOCK@(LI,"C")=100000,@WWLSTOCK@(LI,"S")=DI,@WWLSTOCK@(LI,"I")=L,@WWLSTOCK@(LI,"D")=SI
 Q

