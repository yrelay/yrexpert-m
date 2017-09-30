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

;TO3ARTHE^INT^1^59547,74869^0
TO3ARTHE ;
 
 
 K ^DEJAVU($I),^COMPNOM($I,YA),^ARBTHEO($I,YA) S THE("%VELO")=0,THE("RAC")=YA,THE("ARB")="^ARBTHEO($I,YA",^ARBTHEO($I,YA,0)=YA,^COMPNOM($I,YA,YA)=1
 S THE("TOTAB")="^[QUI]NOMENC(THE(""RAC""))",THE("IPI")=1,COMP=-1,THE("NIV")="0",THE("LAT")=1,%PFMAX=0,PILC(0)=YA,^DEJAVU($I,YA)=1
GET I COMP'=-1 D ^%ABSIDEN K ^DEJAVU($I,COMPID)
 S COMP=$N(@THE("TOTAB")@(COMP)) G:COMP=-1 SUIT D ^%ABSIDEN I $D(^DEJAVU($I,COMPID)) S THE("%VELO")=1 G SUIT
 
 S PILC(THE("IPI"))=COMPID_"^"_THE("NIV")_","_THE("LAT"),THE("REF")=THE("NIV")_","_THE("LAT")
 S THE("TREF")=THE("ARB")_","_THE("REF")_")"
 S THE("PFMAX")=$L(THE("REF"),",")
 S %PFMAX=$S(THE("PFMAX")>%PFMAX:THE("PFMAX"),1:%PFMAX)
 S @THE("TREF")=COMPID,^COMPNOM($I,YA,COMPID)=1,^DEJAVU($I,COMPID)=1
 
 S THE("NIV")=THE("NIV")_","_THE("LAT"),THE("IPI")=THE("IPI")+1,THE("LAT")=1,THE("RAC")=COMPID,COMP=-1
 G GET
 
SUIT S THE("IPI")=THE("IPI")-1 G:('($D(PILC(THE("IPI")))))!(THE("IPI")=0) FIN
 
 S THE("RAC")=$P(PILC(THE("IPI")-1),"^",1),COMP=$P(PILC(THE("IPI")),"^",1),THE("NIV")=$P(PILC(THE("IPI")),"^",2)
 S THE("WW")=$L(THE("NIV"),",")
 S THE("LAT")=$P(THE("NIV"),",",THE("WW"))+1
 S THE("NIV")=$P(THE("NIV"),",",1,THE("WW")-1)
 G GET
 
FIN K ^DEJAVU($I),THE,COMP,COMPID,PILC Q
 
TEST W $$^%QZCHW("Racine : ") R YA D TO3ARTHE Q

