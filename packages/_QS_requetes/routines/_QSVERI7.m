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

;%QSVERI7^INT^1^59547,73883^0
QSVERI7 ;
 
 
 
 
VER36 S MSG=REP1_$$^%QZCHW(" est en relation avec lui-meme via ")_LIEN_$$^%QZCHW("  : ")
 I '($D(@TEMPO@(M,"LIES",REP2,REP1,LINV))) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il manque le lien reciproque...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=1 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas etre le pere de ")_REP2 D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=2 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas etre le fils de ")_REP2 D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=3 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre relationnel...") D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=4 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("Erreur sur le type du lien ...") D WRITE^%QSVERER S SYNTAX=1
 Q
 
 
 
VER37 S MSG=REP1_$$^%QZCHW(" est en relation avec lui-meme via ")_LIEN_$$^%QZCHW("  : ")
 I '($D(@TEMPO@(M,"LIES",REP2,REP1,LINV))) S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il manque le lien reciproque...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=1 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas etre le pere de ")_REP2 D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=2 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("il ne peut pas etre le fils de ")_REP2 D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=3 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("le lien reciproque ne peut pas etre relationnel...") D WRITE^%QSVERER S SYNTAX=1
 I @TEMPO@(M,"LIES",REP2,REP1,LINV)=5 S ERREUR="<SYNTAX>",%VAR=MSG_$$^%QZCHW("Erreur sur le type du lien ...") D WRITE^%QSVERER S SYNTAX=1
 Q
STOCLI 
 S:'($D(@TABLI@(REP1,REP2,LIAI))) @TABLI@(REP1,REP2,LIAI)=0
 S @TABLI@(REP1,REP2,LIAI)=@TABLI@(REP1,REP2,LIAI)+1
 Q
VERLI 
 
 N R1,R2,T,%R1,%R2,%T,CPT
 S R1=""
 F %R1=0:0 S R1=$O(@TABLI@(R1)) Q:R1=""  S R2="" F %R2=0:0 S R2=$O(@TABLI@(R1,R2)) Q:R2=""  S T="",CPT=0 F %T=0:0 S T=$O(@TABLI@(R1,R2,T)),CPT=CPT+1 Q:T=""  D CTR
 Q
CTR I R1=R2 D CTR2 Q
 I CPT>1 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Il existe des liens de type different entre le repertoire ")_R1_$$^%QZCHW(" et le repertoire ")_R2 D WRITE^%QSVERER S SYNTAX=1
 I T=1,@TABLI@(R1,R2,T)>1 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Le repertoire ")_R1_$$^%QZCHW(" a plusieurs liens peres avec le repertoire ")_R2 D WRITE^%QSVERER S SYNTAX=1
 I T=2,@TABLI@(R1,R2,T)>1 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Le repertoire ")_R1_$$^%QZCHW(" a plusieurs liens fils avec le repertoire ")_R2 D WRITE^%QSVERER S SYNTAX=1
 Q
CTR2 N T2
 S T2=$S(T=4:5,T=5:4,1:0)
 I T2=0 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Le repertoire ")_R1_$$^%QZCHW(" est lie avec lui-meme mais le lien n'est pas de type involutif...") D WRITE^%QSVERER S SYNTAX=1 Q
 I @TABLI@(R1,R2,T)'=@TABLI@(R1,R2,T2) S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Les liens involutifs du repertoire ")_R1_$$^%QZCHW(" sont mal definis: il manque des liens reciproques ...") D WRITE^%QSVERER S SYNTAX=1
 Q

