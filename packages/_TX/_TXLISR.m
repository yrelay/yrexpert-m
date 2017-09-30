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

;%TXLISR^INT^1^59547,74031^0
%TXLISR ;
 
 
 
 
 
 N IMPR,SOR,HEU,PAG,NOM,NAIS,PREN,TEL,DOS,COM,COMP,CH,CONT,TEMP,STOP,NBR,NFIX
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 D HRV^%TXINDH,CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Liste des rendez-vous"),0)
 S DX=0,DY=10 X XY W $$^%QZCHW("Voulez vous les rendez-vous du")," ",TAD," ",$$^%QZCHW("sur")," "
 S SOR=$$^%VZESOR("E") Q:SOR=-1
 S MSG=$$^%QZCHW("Activite de ")_" "_%POSTE_"     "_$$^%QZCHW("en date du")_" "_DAY_" "_TAD
 S HEU="",NBR=0
 G @SOR
 
0 
 N MEN,PAGE,ADR,CTR
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S PAGE=$$CONCAS^%QZCHAD(TEMP,"PAGE")
 S @MEN@(1)="+^PLUS",@MEN@(1,"EQU")="="
 S @MEN@(1,"COM")=$$^%QZCHW("Page suivante")
 S @MEN@(2)="-^MOINS",@MEN@(2,"EQU")="_"
 S @MEN@(2,"COM")=$$^%QZCHW("Page precedente")
 S @MEN@(3)="Abandon^FIN"
 D CLEPAG^%VVIDEO
 S DX=5,DY=0 D REV^%VVIDEO X XY W MSG
 D NORM^%VVIDEO S DX=0,DY=1 X XY
 D RLIB
 Q
1 
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR
 S (RM,IOM)=80,IO=IMPR,IOST="P-QUME",IOP=IMPR
 D ^%IS S DOC="X" D MW+1^WPPRINT
 O IMPR U IMPR I (IMPR=3)!(IMPR=6) W !,!,!,!,!,!,!,!
 W ?5,MSG,!
 D RLIB
 Q
 
RLIB S PAG=1
 D ^%TXLISL
 
 W ! S PAG=PAG+1,DX=0,DY=3
 D:SOR=0 CLEBAS^%VVIDEO G:CONT=0 FIN
LHEUR 
 S HEU=$O(^[QUI]RDV(TAD,HEU)) W:HEU="" !,! G:HEU="" QUES
 S NOM=""
LNOM 
 S NOM=$O(^[QUI]RDV(TAD,HEU,NOM)) G:NOM="" LHEUR S NAIS=""
LNAIS 
 S NAIS=$O(^[QUI]RDV(TAD,HEU,NOM,NAIS)) G:NAIS="" LNOM S COM=""
LCOM S:NBR=0 COMP=COM
 S COM=$O(^[QUI]RDV(TAD,HEU,NOM,NAIS,COM)) G:COM="" LNAIS
 I $D(^[QUI]RDV(TAD,HEU,NOM,NAIS,COM))=1 S CH=^[QUI]RDV(TAD,HEU,NOM,NAIS,COM)
 E  S CH=^[QUI]RDV(TAD,HEU,NOM,NAIS,COM,1)
 I NOM="RESERVE" S NBR=NBR+1 W !,?5,"Periode reservee de ",HEU," a ",$P(CH,"^",1) G XXX
 S PREN=$P(CH,"^",3),OBJ=$E(COM,1,8)
 S:PREN="" PREN="-"
 S DOS=$$VERIF^IFUCONT(NOM,PREN,NAIS,.STOP)
 I DOS="" S DOS="-",SEXE="-",TEL="-" G IMPR
 S SEXE=$$^%QSCALVA("PATIENT",I,"SEXE"),SEXE=$S((SEXE="")!(SEXE="F"):"Mme",1:"Mr"),TEL=$$^%QSCALVA("PATIENT",I,"TELEPHONE")
IMPR 
 S:PREN="?" PREN="-" S:TEL="" TEL="-" S:OBJ="?" OBJ="-"
 S:NBR=0 @PAGE@(PAG)=HEU_"^"_NOM_"^"_NAIS_"^"_COMP
 S NBR=NBR+1
 W !,HEU,?8,SEXE,?12,$E(NOM,1,18),?30,$E(PREN,1,15),?45,DOS,?55,$E(TEL,1,12),?70,OBJ
XXX G:(SOR=0)&(NBR=19) QUES
 G LCOM
QUES 
 I SOR=1 W # C IMPR U 0 G FIN
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(30,80,22,MEN,.ADR,.CTR)
 Q:CTR="F"  G:CTR="A" FIN
 G:ADR'="" @ADR G ACT
 
PLUS G:HEU="" QUES
 S PAG=PAG+1,DX=0,DY=2,NBR=0 D CLEBAS^%VVIDEO G LCOM
MOINS G:(PAG=2)&(NFIX=0) QUES G:PAG=2 RLIB
 S PAG=PAG-1,NBR=0,HEU=$P(@PAGE@(PAG),"^",1),NOM=$P(@PAGE@(PAG),"^",2),NAIS=$P(@PAGE@(PAG),"^",3),COM=$P(@PAGE@(PAG),"^",4)
 S DX=0,DY=2 D CLEBAS^%VVIDEO G LCOM
 
FIN D CLEPAG^%VVIDEO
 K @(TEMP) Q

