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

;%SCOAINT^INT^1^59547,73888^0
SCOAINT(REGLE,REPS,OBJS,REPC,OBJC,VISU,%ROUT99) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N SAVROUT,VIDE,CONTEXTE,TETE,TEXT
 
 D:VISU MSG^%VZEATT("Evaluation partie condition")
 N CXT,POS,REPIS,REPIC,OK,MODAF S OK=1,MODAF=0
 S REPIS=$$NOMINT^%QSF(REPS) I REPIS="" S OK=0 G FIN
 S REPIC=$$NOMINT^%QSF(REPC) I REPIC="" S OK=0 G FIN
 S (CXT("@","BASE"),CXT("REFERENCE","BASE"))=REPIS,(CXT("@","OBJET"),CXT("REFERENCE","OBJET"))=OBJS
 S CXT("CIBLE","BASE")=REPIC,CXT("CIBLE","OBJET")=OBJC
 
 S LIG="",SAVROUT=%ROUT99
LOOP I '(OK) G FIN
 S LIG=$O(@REGLE@(LIG))
 I LIG="" G FIN
 S TETE=@REGLE@(LIG,"TETE")
 S TEXT=@REGLE@(LIG)
 
 S %ROUT99=SAVROUT,EXP=$$SUBST^%ANARBR2(TETE,.CXT,"",.POS)
 I POS=0 S OK=0 G LOOP
 
 I EXP=0 S OK=0 G LOOP
 
 G LOOP
 
FIN 
 D:VISU POCLEPA^%VVIDEO Q OK

