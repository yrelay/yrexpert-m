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

;%QSGE1^INT^1^59547,73881^0
QSGE1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RA(BASE,ATTS) 
 N GLO,I,ATT
 S GLO=$$LISTATT2^%QSGEST6(BASE)
 S ATT=$O(@GLO@(""))
 F I=0:0 Q:ATT=""  D RA1 S ATT=$O(@GLO@(ATT))
 Q
RA1 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 S @ATTS@(ATT)=""
 Q
 
RIA(BASE,IND,ATTS) 
 N GLO,I,ATT
 
 I BASE=$$LIENI^%QSGEL3 D LIA(IND,ATTS) Q
 
 S GLO=$$LISTATT1^%QSGEST6(BASE,IND)
 S ATT=$O(@GLO@(""))
 F I=0:0 Q:ATT=""  D RA1 S ATT=$O(@GLO@(ATT))
 Q
 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 S @ATTS@(ATT)=""
 Q
LIA(IND,ATTS) 
 N GLO,I,ATT,BASE,RR,RR1
 S RR="RR1"
 D PATOUCH^%QSGES19(RR)
 S BASE=$$LIENI^%QSGEL3
 S GLO=$$LISTATT1^%QSGEST6(BASE,IND)
 S ATT=$O(@GLO@(""))
 F I=0:0 Q:ATT=""  D LIA1 S ATT=$O(@GLO@(ATT))
 Q
LIA1 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 I $D(@RR@(ATT)) Q
 S @ATTS@(ATT)=""
 Q
 
 
 
 
LS(GLO) 
 D ^%QCAGLTX("ATTL^%QSGE1",GLO)
 Q
ATTL ;;|"NOM"||
 ;;|"LOCALISATION"||
 ;;|"AUTEUR"||
 ;;|"AUTRE"||
 ;;|"CREATION"||
 ;;|"DATE.CREATION"||
 ;;|"HEURE.CREATION"||
 ;;|"DATE.UTILISATION"||
 ;;|"HEURE.UTILISATION"||
 ;;|"UTILISATION"||
 ;;|"OBJET"||
 ;;|"BASE"||
 ;;|"TRIABLE"||
 ;;|"TRIEE"||
 ;;|"ADRESSE"||
 ;;|"TYPE.OBJET"||
 ;;|"SOURCE"||
 ;;|"CARD"||
 ;;
 
 
 
 
 
 
LISTA(IND,ATTS) 
 N GLO,I,ATT,BASE,RR,RR1
 S RR="RR1"
 D LS(RR)
 S BASE="L0"
 S GLO=$$LISTATT1^%QSGEST6(BASE,IND)
 S ATT=$O(@GLO@(""))
 F I=0:0 Q:ATT=""  D LISTA1 S ATT=$O(@GLO@(ATT))
 Q
LISTA1 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 I $D(@RR@(ATT)) Q
 S @ATTS@(ATT)=""
 Q

