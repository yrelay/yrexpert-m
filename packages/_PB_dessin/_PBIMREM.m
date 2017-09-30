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

;%PBIMREM^INT^1^59547,73873^0
PTIREMDE ;
 I ^[QUI]GRAPHE2(O,V)=0 D ^%VSQUEAK Q
 N ADRES,CONTR,COUR,%F,MAX,MENU,STOP,SYNT,TEXT
 D EFFBAS^%PBMEN
 S STOP=0,(COUR,MAX)=^[QUI]GRAPHE2(O,V)
 D REVE(COUR) F %F=0:0 D TCOUR Q:STOP
 Q
TCOUR 
L0 
 D TEXT(COUR)
 S %9STR="" F I="Reculer","Avancer","Gommer","Syntaxe" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,0,%9STR),CUROFF^%PBMEN
 R *ADRES
 D CURON^%PBMEN
 I (ADRES=1)!(ADRES=6) D NORM(COUR) S STOP=1 Q
 S ADRES=$C(ADRES)
 I (ADRES="R")!(ADRES=1) G RECU
 I (ADRES="A")!(ADRES=2) G AVAN
 I (ADRES="G")!(ADRES=2) G GOMM
 I (ADRES="S")!(ADRES=2) G SYNT
 D ^%VSQUEAK G L0
AVAN I COUR=MAX D ^%VSQUEAK Q
 D NORM(COUR) S COUR=COUR+1 D REVE(COUR) Q
RECU I COUR=1 D ^%VSQUEAK Q
 D NORM(COUR) S COUR=COUR-1 D REVE(COUR) Q
GOMM 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Confirmez la gomme par (G)"),CUROFF^%PBMEN
 R *R:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 Q:R'=71
 D ^%PBPZGRA,EFFP(COUR)
 
 D SUP^%PBSOV(O,V,COUR)
 S MAX=MAX-1 I MAX=0 S STOP=1 Q
 I COUR<MAX S COUR=COUR+1 D REVE(COUR) Q
 S COUR=COUR-1 D REVE(COUR) Q
SYNT D ^%PBIMODS Q
NORM(E) D ^%PBPZGRA,EFFP(E),AFF2^%PBEL(O,V,0,0,0,1,E,0,VISIBL,0) Q  W *
REVE(E) D ^%PBPZGRA,EFFA(E),AFF2^%PBEL(O,V,0,0,0,1,E,0,VISIBL,1) Q  W *
EFFA(E) D AFF2^%PBEL(O,V,0,0,0,1,E,1,VISIBL,0) Q
EFFP(E) D AFF2^%PBEL(O,V,0,0,0,1,E,1,VISIBL,1) Q
TEXT(E) D TEXT^%PBEL3(O,V,COUR,35,23,.TEXT,.SYNT) Q

