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

;%QSVARE2^INT^1^59547,73883^0
QSVARE2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REP 
 N %R,%QUE,CTR,Y1
 S Y1=BASE
L0 D LIRE2^%VREAD("",Y1,1,65,8,6,"","",.CTR,.Y1) G:CTR="A" END
 S:Y1="" Y1=^[QUI]RQSDEFAU G:Y1'="?" L1
 D ^%QSCHQUE D:%R REAFF^%QSVAREC I %QUE="" G L0
 S BASE=%QUE G END
L1 I Y1=$$NOMLOG^%QSF($$LIENI^%QSGEL3) G L10
 I '($D(^[QUI]RQSAUTOR(WHOIS,Y1))) D ^%VZEAVT($$^%QZCHW("repertoire inconnu")) G L0
L10 S BASE=Y1
END S DX=2,DY=7 X XY W $J("",30) X XY W BASE Q
 
 
COM 
 N Y1,CTR
 S Y1=COMM
 D LIRE2^%VREAD("",Y1,1,78,5,3,"","",.CTR,.Y1)
ENDC S COMM=Y1,DX=2,DY=4 X XY W COMM
 Q
 
 
ETAT 
 N Y1,CTR
E0 S Y1=ETAT
 D LIRE2^%VREAD("",Y1,67,79,8,6,"","",.CTR,.Y1)
 I Y1="?" D ^%VZEAVT($$^%QZCHW("valeurs autorisees : ACTIVE ou NON ACTIVE")) G E0
 I (Y1'="ACTIVE")&(Y1'="NON ACTIVE") D ^%VZEAVT($$^%QZCHW("valeur incorrecte")_", "_$$^%QZCHW("valeurs autorisees : ACTIVE ou NON ACTIVE")) G E0
FINE S ETAT=Y1,DX=68,DY=7 X XY W $J(" ",10) X XY W Y1
 Q
 
 
ATT 
 N CHOIX,REP,CONCUR,PCHCOMP
 I BASE="" D ^%VZEAVT($$^%QZCHW("le repertoire doit etre defini en premier")) Q
 S REP=$$NOMINT^%QSF(BASE)
 S Y1=ATT
A0 D LIRE2^%VREAD("",Y1,1,56,11,9,"","",.CTR,.Y1)
 G:Y1'="?" A1
 S CHOIX=$$SEL^%QSGEST6($$LISTATT2^%QSGEST6(REP),$$^%QZCHW("choisissez un attribut")) D REAFF^%QSVAREC I CHOIX="" G A0
 S Y1=CHOIX G ENDA
A1 S CONCUR=$$LEX^%LXSTOCK(Y1,.PCHCOMP)
 I CONCUR=0 D ^%VZEAVT($$^%QZCHW("attribut inconnu")) G A0
 I CONCUR=2 D ^%VZEAVT($$^%QZCHW("abreviation ambigue")) G A0
 S Y1=PCHCOMP
ENDA S ATT=Y1,DX=2,DY=10 X XY W $J("",54) X XY W ATT Q
 
 
MAJ 
 N Y1,CTR
 S Y1=TYPMAJ
M0 D LIRE2^%VREAD("",Y1,58,78,11,9,"","",.CTR,.Y1)
 G:Y1'="?" M1
 
 
 D ^%VZEAVT($$^%QZCHW("AJOUT, MODIFICATION ou SUPPRESSION / rien pour les 3 cas")) G M0
M1 
 
 I (((Y1'="")&(Y1'="AJOUT"))&(Y1'="MODIFICATION"))&(Y1'="SUPPRESSION") D ^%VZEAVT($$^%QZCHW("type inconnu")) G M0
ENDT S TYPMAJ=Y1,DX=59,DY=10 X XY W Y1 Q
 
 
SIT 
 I BASE="" D ^%VZEAVT($$^%QZCHW("le repertoire doit etre defini en premier")) Q
 D ZLISTE4^%QULIMO(0,12,79,5,SITL,.NOLS,"UCAS^%QSVARE2(1)","UCSS^%QSVARE2","",SITCC)
 Q
 
UCAS(BOOL) 
 
 
 
 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,ATTD,APPD,APPEX,%PROVEN
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,CH,NORES,P,RESULT,TEMPO
 K ^SANAREQ($J) S ^NAVARACT($J)=1,NOCOMPIL=0
 S (ATTD,APPD,APPEX)=0,%PROVEN="TRT"
 S SAVY1=Y1,SX=DX,SY=DY,(POSIT,P)=1
 I '(BOOL) D INIT2^%AN7(SX,SY) G SUIT
 D INIT^%AN7(SX,SY)
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
SUIT 
 D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 
 I $E(CH)=":" D AFF^%AN7(":") S %COMPIL=";" G SUIT2
 
 S %COMPIL="I ("
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("SUIT0^%QSVARE2")
 G COND^%AN4
SUIT0 
 D END^%AN7,EPIL^%ANGEPIL K @(TEMPO),^NAVARACT($J)
 S %COMPIL=%COMPIL_") S EXP=1"
SUIT2 S OK=RESULT
 I '(OK) D ^%VSQUEAK G FIN
 
SUIT1 
 S @SITC@(P1C)=%COMPIL
FIN 
 D KILL^%ANA(NORES)
 S Y1=SAVY1,DX=SX,DY=SY
 Q
 
UCSS 
 N RA
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
 S OK=1 Q
 
 
ACT 
 I BASE="" D ^%VZEAVT($$^%QZCHW("le repertoire doit etre defini en premier")) Q
 D ^%QULIMO(0,17,79,6,ACT,.NOLA,"UCAA^%QSVARE2(1)","UCSA^%QSVARE2")
 Q
 
UCAA(BOOL) 
 
 
 
 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,APPD,ATTD,APPEX,%PROVEN
 K ^SANAREQ($J)
 S (APPD,ATTD,APPEX)=0,%PROVEN="TRT",^NAVARACT($J)=1,NOCOMPIL=1
 S SAVY1=Y1,SX=DX,SY=DY,POSIT=1
 I BOOL D INIT^%AN7(SX,SY) S RA=$$VAL^%QULIMO("TETE") G SUITA
 D INIT2^%AN7(SX,SY) S RA=@ACT@(P1C,"TETE")
SUITA D:RA'="" KILL^%ANA(RA)
 S OK=$$LIGN^%AN15(Y1,.POSIT,.RA) D END^%AN7
 I '(OK) D ^%VSQUEAK G FINA
 I BOOL D AFF^%QULIMO("TETE",RA) G FINA
 S @ACT@(P1C,"TETE")=RA
FINA S Y1=SAVY1,DX=SX,DY=SY K ^NAVARACT($J) Q
 
UCSA 
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
 S OK=1 Q

