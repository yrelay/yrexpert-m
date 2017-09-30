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

;%QWCYCLE^INT^1^59547,73886^0
%QWCYCLE ;;02:44 PM  4 Sep 1996
 
 
 
 
 
TSTBCL(ISTP,IH) 
 Q:ISTP=0 0 Q:(ISTP#20)=0 1 Q 0
 
BOUCLE(STPCO,ADRIDEM) 
 N SIDEM,I,SKM,REP,NOBCL,PHAS
 Q:STPCO<2 0
 
 F SIDEM=STPCO-1:-1 Q:SIDEM=0  Q:$$COMPSTEP(STPCO,SIDEM)
 Q:SIDEM=0 0
 S PHAS=STPCO-SIDEM,REP=PHAS-1
 Q:SIDEM<PHAS 0
 S NOBCL=0
 F SKM=1:1:REP I '($$COMPSTEP(STPCO-SKM,SIDEM-SKM)) S NOBCL=1 Q
 Q:NOBCL 0
 F I=PHAS+1:1 S CPT=I#PHAS Q:STPCO=I  Q:'($$COMPSTEP(STPCO-I,STPCO-CPT))
 S @ADRIDEM=(STPCO-I)+PHAS
 Q 1
 
COMPSTEP(I1,I2) 
 N GL1,GL2,GB1,GB2,REF1,REF2
 Q:@WWSTEP@(I1,"SOURCE")'=@WWSTEP@(I2,"SOURCE") 0
 S GL1=$$CONCAT^%QZCHAD($$CONCAT^%QZCHAD(WWSTEP,I1),"""P""")
 S GL2=$$CONCAT^%QZCHAD($$CONCAT^%QZCHAD(WWSTEP,I2),"""P""")
 S REF1=$E(GL1,1,$L(GL1)-1)
 S REF2=$E(GL2,1,$L(GL2)-1)
 S GL1=$$^%Q($Q(@GL1))  ;; cao debug ^%Q
 S GL2=$$^%Q($Q(@GL2))  ;; cao debug ^%Q
COMP1 S X1=$P(GL1,REF1,2),X2=$P(GL2,REF2,2)
 I (X1="")&(X2="") Q 1
 I X1'=X2 Q 0
 I @GL1'=@GL2 Q 0
 S GL1=$$^%Q($Q(@GL1)) ;; cao debug ^%Q 
 S GL2=$$^%Q($Q(@GL2)) ;; cao debug ^%Q
 G COMP1

