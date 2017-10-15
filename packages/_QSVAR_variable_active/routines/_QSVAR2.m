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

;%QSVAR2^INT^1^59547,73883^0
QSVAR2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CRE(T) 
 N ACT,ATT,BASE,COMM,NOLA,NOLS,SITL,SITC,SITCC,TYPMAJ,VA,ETAT
CRE2 D POCLEPA^%VVIDEO
 S VA=$$^%VZAME1($$^%QZCHW("nom de la nouvelle variable active")_" : ") D POCLEPA^%VVIDEO Q:CTRLA!(VA="") 1
 I $$EXIST^%QSVAREL(T,VA) D ^%VZEAVT($$^%QZCHW("cette variable active existe deja")) G CRE2
 D INIT^%QSVAREL(T,VA) S (NOLA,NOLS)=1
 D ^%QSVAREC(T,VA)
 I '(OK) D INIT^%QSVAREL(T,VA) Q 2
 D INIT2^%QUAPAGM,AFFP^%QUAPAGM(VA) Q 2
 
 
MOD(T) 
 N ACT,ATT,BASE,COMM,NOLA,NOLS,SITL,SITC,SITCC,TYPMAJ,VA,ETAT
 D ^%QUAPAD($$^%QZCHW("MODIFICATION D'UNE VARIABLE ACTIVE"))
 S VA=$$UN^%QUAPAGM Q:VA="" 1
 D LECT^%QSVAREL(T,VA,"") S (NOLA,NOLS)=1
 D ^%QSVAREC(T,VA) Q 2
 
 
DUP(T) 
 N NEWVAR,VA,ACT,ATT,BASE,COMM,NOLA,NOLS,SITL,SITC,SITCC,ETAT,TYPMAJ
 D ^%QUAPAD($$^%QZCHW("DUPLICATION D'UNE VARIABLE ACTIVE"))
 S VA=$$UN^%QUAPAGM Q:VA="" 1
LAFF D POCLEPA^%VVIDEO S NEWVAR=$$^%VZAME1($$^%QZCHW("nom de la recopie")_" : ") Q:CTRLA!(NEWVAR="") 1
 I $$EXIST^%QSVAREL(T,NEWVAR) D ^%VZEAVT($$^%QZCHW("il existe deja une variable active de ce nom")) G LAFF
 D LECT^%QSVAREL(T,VA,NEWVAR) S (NOLA,NOLS)=1
 S VA=NEWVAR D ^%QSVAREC(T,VA)
 I '(OK) D INIT^%QSVAREL(T,VA) Q 2
 D INIT2^%QUAPAGM,AFFP^%QUAPAGM(NEWVAR) Q 2
 
 
SUP(T) 
 N ENS,R,VA
 D ^%QUAPAD($$^%QZCHW("SUPPRESSION DE VARIABLES ACTIVES"))
 S ENS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ENSVAR") K @(ENS)
 D ENS^%QUAPAGM(ENS) Q:$D(@ENS)=0 1
 D POCLEPA^%VVIDEO S R=$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer cette(ces) variable active(s) ?"))
 I R'=1 D POCLEPA^%VVIDEO Q 1
 D ^%VZEATT
 S VA=""
BSUP S VA=$O(@ENS@(VA))
 I VA="" G FINSUP
 D SUPPR^%QSVAREL(T,VA)
 G BSUP
FINSUP K @(ENS) D INIT2^%QUAPAGM Q 2
 
 
ANAL(T) 
 N %A,LSUP,VA,ROUTREAF
 S ROUTREAF="REAFFB^%QSVAREC"
 D ^%QUAPAD($$^%QZCHW("ANALYSE DE VARIABLES ACTIVES"))
 S LSUP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ENSVAR") K @(LSUP)
 D ENS^%QUAPAGM(LSUP) Q:$D(@LSUP)=0 1
 S VA="" F %A=0:0 S VA=$O(@LSUP@(VA)) Q:VA=""  D ANA
 K @(LSUP) Q 2
ANA 
 N A,ACT,ATT,BASE,COMM,DX,DY,OK,P1C,SITL,SITC,SITCC,ETAT,TYPMAJ,Y1
 D LECT^%QSVAREL(T,VA,"") S (NOLA,NOLS)=1
 D REAFF^%QSVAREC
 D MSG^%VZEATT($$^%QZCHW("analyse de ")_VA_$$^%QZCHW(" en cours "))
 S OK=1,DX=2,DY=10,P1C=0
 S A=""
ANASIT 
 S A=$O(@SITL@(A))
 I (A="")!(OK=0) G FANSIT
 S Y1=@SITL@(A),DY=DY+1,P1C=P1C+1 D UCAS^%QSVARE2(0)
 G ANASIT
FANSIT I '(OK) D ^%VZEAVT($$^%QZCHW("probleme au niveau d'une des situations")) Q
 
 S A="",OK=1
 S DX=2,DY=16,P1C=0
ANAACT 
 S A=$O(@ACT@(A))
 I (A="")!(OK=0) G FANACT
 S Y1=@ACT@(A),DY=DY+1,P1C=P1C+1 D UCAA^%QSVARE2(0)
 G ANAACT
FANACT I '(OK) D ^%VZEAVT($$^%QZCHW("probleme au niveau d'une des actions")) Q
 D ^%VZEAVT($$^%QZCHW("analyse correcte"))
 Q
 
 
AFF(T) 
 N ACT,ATT,BASE,COMM,NOLA,NOLS,SITL,SITC,SITCC,ETAT,TYPMAJ,VA
 D ^%QUAPAD($$^%QZCHW("CONSULTATION D'UNE VARIABLE ACTIVE"))
 S VA=$$UN^%QUAPAGM Q:VA="" 1
 D LECT^%QSVAREL(T,VA,"") S (NOLA,NOLS)=1
 D REAFF^%QSVAREC
 D ^%VZEAVT("") Q 2
 
 
IMP(T) 
 N ACT,ATT,COMM,BASE,SITL,SITC,SITCC,TYPMAJ,ENS,R,VA,ETAT
 D ^%QUAPAD($$^%QZCHW("IMPRESSION DE VARIABLES ACTIVES"))
 S ENS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ENSVAR") K @(ENS)
 D ENS^%QUAPAGM(ENS) Q:$D(@ENS)=0 1
 D ^%VZEATT
 S VA=""
 D DEB^%QSVARI(.R)
BIMP S VA=$O(@ENS@(VA))
 I VA="" G FINIMP
 D LECT^%QSVAREL(T,VA,""),^%QSVARI(R)
 G BIMP
FINIMP K @(ENS)
 D FIN^%QSVARI(R)
 D INIT2^%QUAPAGM Q 2

