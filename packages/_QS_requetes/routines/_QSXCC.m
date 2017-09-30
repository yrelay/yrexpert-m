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

;%QSXCC^INT^1^59547,73883^0
QSXCC(STO,MODE,IMP) 
 
 
 
 
 
 
 
 
 
 
 
 N I,J,K,BASE,ATT,QUERY,LI,CARD,VISU,RESUL,TEMPS,CALC
 S RESUL=$$CONCAS^%QZCHAD(STO,"RESUL,"_MODE)
 S TEMPS=$$CONCAS^%QZCHAD(STO,"TEMPS")
 S CALC=$$CONCAS^%QZCHAD(STO,"CALC")
 S LI=$ZP(@IMP@(""))+1
 S VISU=0
 S @IMP@(LI)=$$^%QZCHW("Cardinaux des 4 querys pour <base> et <attribut>")
 S LI=LI+1
 S @IMP@(LI)=$S(MODE="LIEN":$$^%QZCHW("verification des liens"),1:$$^%QZCHW("verification des attributs")),LI=LI+1
 I '($D(@RESUL)) S @IMP@(LI)=$$^%QZCHW("verification pas effectuee") Q
 S @IMP@(LI)=""
 S LI=LI+1
 S @IMP@(LI)=$J($$^%QZCHW("base"),15)_$J($$^%QZCHW("attribut"),15)_$J("q2",8)_$J("q3",8)_$J("q4",8)_$J("qV",8)
 W:VISU !,@IMP@(LI)
 S LI=LI+1
 S @IMP@(LI)=""
 S BASE=""
 F I=0:0 S BASE=$O(@RESUL@(BASE)) Q:BASE=""  D QSX1
 S LI=LI+1
 D:MODE="LIEN" VIS(STO,IMP,VISU)
 S LI=LI+1
 S @IMP@(LI)=$$^%QZCHW("Duree de la verification : ")_$S($D(@TEMPS)'=0:@TEMPS,1:$$^%QZCHW("verification en cours"))
 Q
QSX1 
 S @IMP@(LI)="",LI=LI+1,@IMP@(LI)=$$NOMLOG^%QSF(BASE),LI=LI+1,@IMP@(LI)=""
 S ATT=""
 F J=0:0 S ATT=$O(@RESUL@(BASE,ATT)) Q:ATT=""  D QSX2
 Q
QSX2 S LI=$ZP(@IMP@(""))+1
 
 S @IMP@(LI)=$E($J(ATT,30),1,30)
 S QUERY=""
 F K=0:0 S QUERY=$O(@RESUL@(BASE,ATT,"CARD",QUERY)) Q:QUERY=""  D QSX3
 I $$ERC^%QSXCB(STO,MODE,BASE,ATT)=1 S @IMP@(LI)=@IMP@(LI)_" erreur !!!"
 W:VISU !,@IMP@(LI)
 Q
QSX3 S CARD=@RESUL@(BASE,ATT,"CARD",QUERY)
 S @IMP@(LI)=@IMP@(LI)_$E($J(CARD,8),1,8)
 Q
AFF(IMP) 
 N DEB
 D CLEPAG^%VVIDEO
 S DEB=1
 D REAFF^%QULYSTE(1,IMP,0,0,80,23)
 D ^%QULYSTE(0,0,80,23,IMP,.DEB,"ADD^%QSXCC","SUP^%QSXCC")
 Q
ADD S OK=0 Q
SUP S OK=0 Q
 
VIS(STO,IMP,VISU) 
 N LI,ERV,BASE,LIEN,I,J
 S ERV=$$CONCAS^%QZCHAD(STO,"ER,VIS")
 S LI=$ZP(@IMP@(""))+1
 S @IMP@(LI)=""
 S LI=LI+1
 S @IMP@(LI)=$$^%QZCHW("cardinaux des liens en vis a vis")
 S LI=LI+1
 S @IMP@(LI)=""
 S LI=LI+1
 S BASE=""
 F I=0:0 S BASE=$O(@ERV@(BASE)) Q:BASE=""  D VIS1
 Q
 
VIS1 S @IMP@(LI)="",LI=LI+1,@IMP@(LI)=$$NOMLOG^%QSF(BASE),LI=LI+1,@IMP@(LI)=""
 S ATT=""
 F I=0:0 S ATT=$O(@ERV@(BASE,"LIEN",ATT)) Q:ATT=""  D VIS2
 Q
VIS2 S @IMP@(LI)=@ERV@(BASE,"LIEN",ATT)
 W:VISU !,@IMP@(LI)
 S LI=LI+1
 Q
 
TEST D ^%QSXCC($$CONCAS^%QZCHAD("^%QSXCB",WHOIS),"LIEN")
 Q
 
INT(MODE) 
 I MODE=1 D ^%QSXCC($$CONCAS^%QZCHAD("^%QSXCB",WHOIS),"LIEN") Q
 I MODE=0 D ^%QSXCC($$CONCAS^%QZCHAD("^%QSXCB",WHOIS),"ATT")
 Q

