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

;%VPRINT^INT^1^59547,74036^0
VVPRINT(LI) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PORT,NBL,TIT,LARG,IMP
 S PORT=$$TABID^%INCOIN("PRINTER")
 D PARAMS^%QCSAP(PORT,.IMP)
 Q:'(IMP)
 
 S NBL=$$TABID^%INCOIN("IMPRCOUR")-2
 S LARG=IMP("RM")
 
 S TIT=""
 D IMP(LI,PORT,NBL,LARG,TIT)
 Q
 
IMPT(LI,TIT) 
 N PORT,NBL,LARG,IMP
 S PORT=$$TABID^%INCOIN("PRINTER")
 D PARAMS^%QCSAP(PORT,.IMP)
 Q:'(IMP)
 
 S NBL=$$TABID^%INCOIN("IMPRCOUR")-2
 S LARG=IMP("RM")
 D IMP(LI,PORT,NBL,LARG,TIT)
 Q
 
IMPPT(LI,PORT,TIT) 
 N NBL,LARG,IMP
 D PARAMS^%QCSAP(PORT,.IMP)
 Q:'(IMP)
 
 S NBL=$$TABID^%INCOIN("IMPRCOUR")-2
 S LARG=IMP("RM")
 D IMP(LI,PORT,NBL,LARG,TIT)
 Q
 
IMP(LI,PORT,NBL,LARG,TIT) 
 
 N PAG,LIG,I,J,DATE,HEUR,STOP
 S DATE=$$DATE2^%QMDATE
 S HEUR=$$HEURE^%QMDATE
 S PAG=0,LIG=1,STOP=0
 C PORT O PORT U PORT
 D ENTETE
 S J=$O(@LI@(""))
 F I=0:0 Q:J=""  D:LIG>NBL ENTETE Q:STOP=1  D IMPL(@LI@(J)) S J=$O(@LI@(J))
 W:TIT'="" !,$$CTR($$^%QZCHW("fin de")_" "_@TIT@(1),LARG)
 W # C PORT
 O 0 U 0
 Q
 
IMPL(TEXT) 
IMPL2 I $L(TEXT)<LARG W !,TEXT S LIG=LIG+1 D:LIG>NBL ENTETE Q
 W !,$E(TEXT,1,LARG-1)
 S LIG=LIG+1
 D:LIG>NBL ENTETE
 S TEXT=$E(TEXT,LARG,999)
 G IMPL2
 
ENTETE 
 N LEN,I,TERM U 0 S TERM=$I
 S:TIT'="" LEN=$O(@TIT@(""))
PAGE I LIG'=1,(PORT=TERM)!(PORT=0) D L7^%SYSLIB3 R *STOP D TOUCHE^%INCCLAV(STOP,.STOP),POCLEPA^%VVIDEO Q:STOP=1
 U PORT W #
 S PAG=PAG+1,LIG=1
 W "Le "_DATE_"  a  "_HEUR,?LARG-10,"Page : "_PAG S LIG=LIG+1
 I TIT="" G FENT
 F I=0:0 Q:LEN=""  G:LIG>NBL PAGE D IMPL($$CTR(@TIT@(LEN),LARG)) S LEN=$O(@TIT@(LEN))
FENT W ! S LIG=LIG+1
 Q
 
CTR(CH,LG) 
 N LIB,DEB,FIN
 S LIB=LG-$L(CH)
 S DEB=LIB\2,DEB=$J("",DEB)
 S FIN=(LIB\2)+(LIB#2),FIN=$J("",FIN)
 Q DEB_CH_FIN

