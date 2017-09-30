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

;%MZINTER^INT^1^59547,73872^0
MOZINTER ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXIMOZ Q $$^%QCAZG("^TABIDENT(WHOIS,""EXIMOZ"")")="OUI"
GAMMES(LGAMME) 
 N I,GAMME
 S GAMME=$O(^TABIDENT(WHOIS,"MOZART",""))
 F I=0:0 Q:GAMME=""  D GAM1 S GAMME=$O(^TABIDENT(WHOIS,"MOZART",GAMME))
 Q
GAM1 S LGAMME(GAMME)="" Q
 
EXGAM(GAMME) Q:GAMME="" 0 Q $S($D(^TABIDENT(WHOIS,"MOZART",GAMME))'=0:1,GAMME="GAMME.MOZART":1,1:0)
 
 
GI(GAMME) 
 
 Q $S($D(^TABIDENT(WHOIS,"MOZART",GAMME,"GE")):$$NOMINT^%QSF(^TABIDENT(WHOIS,"MOZART",GAMME,"GE")),1:"MOZ")
GE(GAMME) 
 Q $S($D(^TABIDENT(WHOIS,"MOZART",GAMME,"GE")):^TABIDENT(WHOIS,"MOZART",GAMME,"GE"),1:"GAMME")
OI(GAMME) 
 
 Q $S($D(^TABIDENT(WHOIS,"MOZART",GAMME,"OE")):$$NOMINT^%QSF(^TABIDENT(WHOIS,"MOZART",GAMME,"OE")),1:"MOZOP")
OE(GAMME) 
 Q $S($D(^TABIDENT(WHOIS,"MOZART",GAMME,"OE")):^TABIDENT(WHOIS,"MOZART",GAMME,"OE"),1:"OPERATION.MOZART")
 
 
 
ISMACH(BASE) 
 Q BASE="POSTE.DE.TRAVAIL"
 
ISOUT(BASE) 
 Q BASE="OUTILLAGE"
 
 
 
MACH(BASE) 
 Q "POSTE.DE.TRAVAIL"
 
OUT(BASE) 
 Q "OUTILLAGE"
 
 
 
 
 
 
 
 
 
 
 
CONNECT(TYPEOB,NOM) 
 I NOM="" Q
 I TYPEOB="GAMME" D AFF("^[QUI]MOZGARDE",NOM,$$VAL("MOZGARDE")) Q
 
 
 Q
 
 
KILL(TYPEOB,NOM) 
 I NOM="" Q
 I TYPEOB="GAMME" K ^[QUI]MOZGARDE(NOM) Q
 I TYPEOB="POSTE.DE.TRAVAIL" K ^[QUI]DESMACH(NOM) Q
 I TYPEOB="OUTILLAGE" K ^[QUI]DESOUT(NOM) Q
 Q
VAL(S) N I,J,K,G S J=^%SCRE(S),K=""
 F I=2:1:J S K=K_$S($D(^%SCRE(S,I,"QUERY")):$C(26),1:"")_"^"
 Q K
 
AFF(GLO,I,V) 
 S @GLO@(I)=V Q
 
AFF2(GLO,NOM,FAMILLE,VAL) 
 I FAMILLE="" S FAMILLE=NOM
 
 K @GLO@(NOM)
 S @GLO@(NOM,FAMILLE)=VAL
 Q

