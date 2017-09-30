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

;%QSO4^INT^1^59547,73883^0
QSO4(BASI,INDIV,RESUL,PAC,XG,YH,XD,YB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,VAR,LVAR,MSG,FT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S IN=$$CONCAS^%QZCHAD(TEMP,"IN")
 S BASE=$$NOMLOG^%QSF(BASI)
 
 S MSG=$$^%QSO1(BASE,.VAR,.LVAR,XG,YH,XD,YB)
 Q:$$FIN(MSG)
 
 S MSG=$$^%QSO3(BASI,.VAR,.LVAR,IN)
 Q:$$FIN(MSG)
 
 S FT=$$CONCAT^%QZCHAD(PAC,"IN")
 S @("MSG="_FT)
 Q:$$FIN(MSG)
 
 S MSG=$$^%QSO5(BASI,IN,INDIV,RESUL)
 Q:$$FIN(MSG)
 K @(TEMP)
 Q
 
FIN(MSG) I MSG="" Q 0
 I MSG=1 K @(TEMP) Q 1
 D ^%VZEAVT($$^%QZCHW(MSG)) K @(TEMP) Q 1
 
TEST S RESUL="^%QS4"
 S BASI="P0"
 S INDIV="ARC22"
 S PAC="$$ATT^%QSO4(""BIDON"")"
 D ^%QSO4(BASI,INDIV,RESUL,PAC,3,3,50,10)
 Q
 
PUT(IN,INT,ATT) 
 N BASE
 Q:((IN="")!(INT=""))!(ATT="") ""
 I $D(@IN@(INT))<9 Q $$^%QZCHW("Vous n'avez pas defini l'individu intermediaire ")_INT
 S BASE=@IN@(INT,"BASE")
 I $$AR^%QSGEST5(BASE,ATT)=0 Q $$^%QZCHW("L'attribut ")_ATT_$$^%QZCHW(" n'existe pas dans le repertoire ")_$$NOMLOG^%QSF
 S @IN@(INT,"ATT",ATT)="" Q ""
 
EXA(IN,INT,ATT) Q:((IN="")!(INT=""))!(ATT="") 0 Q $D(@IN@(INT,"ATT",ATT))'=0
 
EXI(IN,INT) Q:(IN="")!(INT="") 0 Q $D(@IN@(INT,"ATT"))'=0
 
ATT(BIBON,IN) 
 N I,MSG
 F I="NOM^@","NOM^C","NOM^O","MACHINE^O","OPERATION^C" D ATT1
 Q ""
ATT1 S MSG=$$PUT^%QSO4(IN,$P(I,"^",2),$P(I,"^",1))
 I MSG'="" D ^%VZEAVT(MSG)
 Q

