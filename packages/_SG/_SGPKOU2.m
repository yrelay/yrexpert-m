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

;%SGPKOU2^INT^1^59547,73891^0
%SGPKOU2 ;;06:08 PM  9 Dec 1991; ; 28 Sep 93  4:13 PM
 
 
LEX N ELX,OB,%O,TB,TABATT,TYP
 N L,%L,INDOBJ
 S ELX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LX") K @(ELX)
 S TABATT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TB") K @(TABATT)
 I WECR=1 U 0 S DX=10,DY=15 X XY W $J("",60) X XY W $E($$^%QZCHW("Mots utilises"),1,60)
 S OB="" F %O=1:1 S OB=$O(@ETTL@(OB)) Q:OB=""  D t
 S OB="" F %O=1:1 S OB=$O(@EMOD@(OB)) Q:OB=""  D m
 S OB="" F %O=1:1 S OB=$O(@EFOR@(OB)) Q:OB=""  D f
 S OB="" F %O=1:1 S OB=$O(@ERQS@(OB)) Q:OB=""  D r
 S OB="" F %O=1:1 S OB=$O(@EPSV@(OB)) Q:OB=""  D psv
 S OB="" F %O=1:1 S OB=$O(@EPRD@(OB)) Q:OB=""  D p
 D WRITE^%SYSUTI1(IOFI,"MOTS UTILISES")
 S MOT=""
LEXBCL S MOT=$O(@ELX@(MOT)) I MOT="" D WRITE^%SYSUTI1(IOFI,"") Q
 G:'($D(^[QUI]TOLEX(MOT))) LEXBCL
 D WRITE^%SYSUTI1(IOFI,MOT)
 F %O=1:1:7 D WRITE^%SYSUTI1(IOFI,$P(^[QUI]TOLEX(MOT),"^",%O))
 G LEXBCL
 
t 
 N L,%L
 K @(TABATT)
 D MVG^%QSCALVA("TRAITEMENT","t."_OB,"ATTRIBUT.UTILISE",TABATT,.TYP)
 S L="" F %L=0:0 S L=$O(@TABATT@(L)) Q:L=""  S @ELX@(L)=""
 Q
 
m S INDOBJ="m."_OB G std
 
f S INDOBJ="f."_OB G std
 
p S INDOBJ="p."_OB G std
 
std K @(TABATT)
 D MVG^%QSCALVA("TRAITEMENT",INDOBJ,"ATTRIBUT.UTILISE",TABATT,.TYP)
 S L="" F %L=0:0 S L=$O(@TABATT@(L)) Q:L=""  S @ELX@(L)=""
 Q
 
r 
 N L,%L
 I $D(^[QUI]RQS1(OB,"CONTRAINTES")) S L="" F %L=0:0 S L=$O(^[QUI]RQS1(OB,"CONTRAINTES",L)) Q:L=""  I $D(^[QUI]RQS1(OB,"CONTRAINTES",L,"TABATT")) D r2
 Q
r2 S TB=^[QUI]RQS1(OB,"CONTRAINTES",L,"TABATT") Q:TB=""
 S MOT="" F I=1:1 S MOT=$O(^[QUI]RQSDON("RQS","ATT",TB,MOT)) Q:MOT=""  S @ELX@(MOT)=""
 Q
psv 
 N L,%L
 S L="" F %L=0:0 S L=$O(^[QUI]LKYATR2(OB,L)) Q:L=""  S @ELX@($P(L,"~"))=""
q

