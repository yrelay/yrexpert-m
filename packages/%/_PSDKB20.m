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

;%PSDKB20^INT^1^59547,73874^0
%PSDKB20 ;;10:42 AM  10 Jun 1992; ; 07 Jun 93 10:37 AM
 
 
 
 
AXIOMBA(A,TEMP) 
 D DEB^%SGMESU("axiome de base")
 N CXT,T,%T,O,%O,V,%V,R,REP,DOM,IND,PRD
 S PRD=@TEMP@("SPD","AXIOMBA")
 Q:PRD="" 1
 S DX=3,DY=18 X XY W /AB,"test de l'axiome de base",/AA
 S DOM=@TEMP@("DEF","DOM")
 S REP=@A@("REP"),IND=@A@("IND")
 
 D SXSPEED^%QSGESTK("%",$J)
 S T="" F %T=0:0 S T=$O(@A@("%",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("%",T,O)) Q:O=""  S V=@A@("%",T,O) D PA^%QSGESTI("%",$J,T,V,O)
 S T="" F %T=0:0 S T=$O(@A@("CXTPCT",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("CXTPCT",T,O)) Q:O=""  S V=@A@("CXTPCT",T,O),CXT(T,O)=V
 
 S R=$$EVAL^%PSPREV(PRD,REP,IND)
 S DX=30,DY=19 X XY W /AA,$S(R:"--> succes",1:"--> echec ")
 D SXSPEED^%QSGESTK("%",$J)
 S DX=3,DY=18 X XY W /AA,"test de l'axiome de base"
 D FIN^%SGMESU("axiome de base")
 Q R
 
 
SHOWOBJ(A,TEMP) Q
 
 
APPLIQUE(A,q,B,TEMP) 
 D DEB^%SGMESU("1 : preparation de l'application")
 N AT,%A,O,%O,V,T,%T,%V,BASE,OBJET,EXP,G,NOUV,RES,MSG,LIS,CXT,TABIND
 N REP,IND,DOM,VIS,OPE
 N LETMES
 S TABIND=$$CONCAS^%QZCHAD(TEMP,"TBI")
 S VIS=@TEMP@("DEF","VIS")
 S REP=@A@("REP"),IND=@A@("IND"),DOM=$P(q,"^"),OPE=$P(q,"^",2)
 S DX=1,DY=16 X XY W $J("",78)
 
 
 
 
 D SXSPEED^%QSGESTK("%",$J)
 S T="" F %T=0:0 S T=$O(@A@("%",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("%",T,O)) Q:O=""  S V=@A@("%",T,O) D PA^%QSGESTI("%",$J,T,V,O)
 S T="" F %T=0:0 S T=$O(@A@("CXTPCT",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("CXTPCT",T,O)) Q:O=""  S V=@A@("CXTPCT",T,O),CXT(T,O)=V
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J,CXT("@","BASE")=REP,CXT("@","OBJET")=IND
 
 
 D PA^%QSGESTI("%",$J,"%OPERATEUR.COURANT",DOM_","_OPE,1)
 S CXT("%OPERATEUR.COURANT","BASE")="OPERATEUR"
 S CXT("%OPERATEUR.COURANT","OBJET")=DOM_","_OPE
 S NOMTRT=@TEMP@("SPD","OPE",OPE,"PROL")
 D FIN^%SGMESU("1 : preparation de l'application")
 G:NOMTRT="" PREPPRD
 D DEB^%SGMESU("2 : traitement prologue")
 S DX=3,DY=12 X XY W /AB,"traitement prologue "
 S DX=30,DY=12 X XY W /AB,NOMTRT
 S RES=$$CONTEXTO^%TLIACUN(NOMTRT,REP,IND,VIS,0,0,.CXT,.ABAND,1) G:ABAND NOTAPPLI
 S DX=30,DY=12 X XY W /AA,NOMTRT
 S DX=3,DY=12 X XY W "traitement prologue "
 D FIN^%SGMESU("2 : traitement prologue")
 
 
 
 
PREPPRD S DX=3,DY=14 X XY W /AB,"predicats d'application",/AA
 
 D DEB^%SGMESU("3 : predicats d'application")
 S %O=@TEMP@("SPD","OPE",OPE,"PRED")
 F IC=1:1:%O S PRED=@TEMP@("SPD","OPE",OPE,"PRED",IC),DX=30,DY=14 X XY W PRED_$J("",60-$L(PRED)) I '($$EVAL^%PSPREV(PRED,REP,IND)) S DX=30,DY=15 X XY W " -> echec " S DX=3,DY=14 X XY W "predicats d'application" G NOTAPPLI
 S DX=3,DY=14 X XY W "predicats d'application"
 S DX=30,DY=15 X XY W " -> succes"
 D FIN^%SGMESU("3 : predicats d'application")
 
 
 
 D DEB^%SGMESU("4 : preparation execution")
 
 S NOUV=$$GEN^%QCAPOP("IGP")
 D RECOP^%QSGES25(REP,IND,NOUV,"",0)
 D FIN^%SGMESU("4 : preparation execution")
 
 D DEB^%SGMESU("5 : execution")
 
 S %O=@TEMP@("SPD","OPE",OPE,"TRT")
 S DX=3,DY=16 X XY W /AB,"traitements",/AA
 F %IC=1:1:%O S NOMTRT=@TEMP@("SPD","OPE",OPE,"TRT",%IC),DX=30,DY=16 X XY W NOMTRT_$J("",60-$L(NOMTRT)) S RES=$$CONTEXTO^%TLIACUN(NOMTRT,REP,NOUV,VIS,0,0,.CXT,.ABAND,1) G:ABAND NOTAPPLI
 S DX=3,DY=16 X XY W "traitements"
 
 D FIN^%SGMESU("5 : execution")
 D DEB^%SGMESU("6 : epilogue d'execution")
 S B=$$TEMP^%SGUTIL
 S @B@("REP")=REP,@B@("IND")=NOUV
 
 
 S T="" F %T=0:0 S T=$$NXTRIA^%QSTRUC8("%",$J,T) Q:T=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,T,O) Q:O=""  S @B@("%",T,O)=$$VALEUR^%QSTRUC8("%",$J,T,O)
 S T="" F %T=0:0 S T=$O(CXT(T)) Q:T=""  I $E(T)="%" S O="" F %O=0:0 S O=$O(CXT(T,O)) Q:O=""  S V=CXT(T,O),@B@("CXTPCT",T,O)=V
 D SXSPEED^%QSGESTK("%",$J)
 
 
 S VU="" F ZZ=1:1:@TABIND S OBJ=@TABIND@(ZZ) I $$EGALIND^%QSGES24(@OBJ@("REP"),@OBJ@("IND"),@B@("IND")) S VU=OBJ Q
 
 
 I VU'="" D SX^%QSGESTK(REP,NOUV) K @(B) D ADDS^%QSGES26(REP,IND,"OPERATEUR",REP,@VU@("IND")),PA^%QSGESTI($$LIENI^%QSGEL3,$$NOML1^%QSGES20(IND,@VU@("IND"),"OPERATEUR",@VU@("IND")),"PAR.APPLICATION.DE",OPE,1) S B=OBJ D tt Q 1
 
 D ADDS^%QSGES26(REP,IND,"OPERATEUR",REP,NOUV)
 D PA^%QSGESTI($$LIENI^%QSGEL3,$$NOML1^%QSGES20(IND,NOUV,"OPERATEUR",NOUV),"PAR.APPLICATION.DE",OPE,1)
 S @TABIND=@TABIND+1,@TABIND@(@TABIND)=B
 
 D tt
 Q 1
tt D FIN^%SGMESU("6 : epilogue d'execution") Q
 
NOTAPPLI 
 D FIN^%SGMESU("3 : predicats d'application") Q 0
 
 
RECUSE(A,q,TEMP) 
 D DEB^%SGMESU("recusation")
 N AT,%A,O,%O,V,T,%T,%V,BASE,OBJET,EXP,G,NOUV,RES,MSG,LIS,CXT,TABIND
 N REP,IND,DOM,VIS
 S TABIND=$$CONCAS^%QZCHAD(TEMP,"TBI")
 S VIS=@TEMP@("DEF","VIS")
 S REP=@A@("REP"),IND=@A@("IND"),DOM=$P(q,"^"),OPE=$P(q,"^",2)
 
 
 D SXSPEED^%QSGESTK("%",$J)
 S T="" F %T=0:0 S T=$O(@A@("%",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("%",T,O)) Q:O=""  S V=@A@("%",T,O) D PA^%QSGESTI("%",$J,T,V,O)
 S T="" F %T=0:0 S T=$O(@A@("CXTPCT",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@A@("CXTPCT",T,O)) Q:O=""  S V=@A@("CXTPCT",T,O),CXT(T,O)=V
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J,CXT("@","BASE")=REP,CXT("@","OBJET")=IND
 
 D PA^%QSGESTI("%",$J,"%OPERATEUR.COURANT",DOM_","_OPE,1)
 S CXT("%OPERATEUR.COURANT","BASE")="OPERATEUR"
 S CXT("%OPERATEUR.COURANT","OBJET")=DOM_","_OPE
 
 S NOMTRT=@TEMP@("SPD","OPE",OPE,"RECUS")
 I NOMTRT'="" S RES=$$CONTEXTO^%TLIACUN(NOMTRT,REP,IND,VIS,0,0,.CXT,.ABAND,1)
 
 D POCLEPA^%VVIDEO
 D FIN^%SGMESU("recusation")
 Q

