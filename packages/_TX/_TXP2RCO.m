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

;%TXP2RCO^INT^1^59547,74032^0
%TXP2RCO ;;09:13 PM  14 Jan 1993; ; 14 Jan 93  8:40 PM
 
PPAL(t,rfixe,pb) 
 N NUMPB0,LPB
 S LPB="^[QUI]LPB" S:'($D(@LPB)) @LPB=0
 S TABGEN="^[QUI]LPBDEF"
 D DEBCRIT
 K @(LPB),@(TABGEN)
 S (@LPB,NUMPB0)=1
 
 
 S @LPB@(@LPB,"TYPE")="TXP2R"
 S @LPB@(@LPB,"ETAT")="A TRAITER"
 S @LPB@(@LPB,"VAR","t")=t
 S @LPB@(@LPB,"VAR","rfixe")=rfixe
 S @LPB@(@LPB,"VAR","pb")=pb
 
 
 F VAR="ETUDE","ATELIER","ARTICLE","lot","qlot","cst","cprix","VISU","TYPE","PMAX","dmd" S @TABGEN@("VAR",VAR)=@VAR
 F VAR="SIGMADT","RMAXI" S zzz="" F %zzz=0:0 S zzz=$O(@VAR@(zzz)) Q:zzz=""  S @TABGEN@("TAB",VAR,zzz)=@VAR@(zzz)
 
 S @LPB@(@LPB,"PBPERE")=-1
 D FINCRIT
 
 
 
BCPPAL 
 S IPB=""
PPAL1 D DEBCRIT
 S IPB=$O(@LPB@(IPB))
 G:IPB="" PPAL2
 S ETATPB=@LPB@(IPB,"ETAT")
 I ((ETATPB'="ATTENTE")&(ETATPB'="RESOLU"))&(ETATPB'="EN COURS") S @LPB@(IPB,"ETAT")="EN COURS",TYPEPB=@LPB@(IPB,"TYPE") D FINCRIT,SOLVEPB(IPB,TYPEPB,ETATPB) G PPAL1
 D FINCRIT
 D M("en attente de pb a traiter")
 G PPAL1
PPAL2 D FINCRIT
 I @LPB@(NUMPB0,"ETAT")'="RESOLU" G BCPPAL
 D DEBCRIT
 S RES=@LPB@(NUMPB0,"VAR","f")
 K @(LPB),@(TABGEN)
 D FINCRIT
 Q RES
 
 
COSLV 
 
 
 S TABGEN="^[QUI]LPBDEF"
 D INIVAR^%TXPETU
 S ARB="^[QUI]arb(ETUDE)",tapb="^[QUI]apb(ETUDE,ATELIER)",valpb="^[QUI]valpb(ETUDE,ATELIER)",tmax="^[QUI]tmax(ETUDE,ATELIER)"
 D M("en attente de pb a traiter")
 S LPB="^[QUI]LPB"
BCDEB D DEBCRIT
 I '($D(@LPB)) D FINCRIT H 1 G BCDEB
 D FINCRIT
 D RECUGEN
 S IPB="",NBPB=0
 D DEBCRIT
CYC2 S IPB=$O(@LPB@(IPB)),NBPB=NBPB+1
 I IPB="" D RECUGEN G:NBPB=10 PAUSE G CYC2
 S ETATPB=@LPB@(IPB,"ETAT")
 I ((ETATPB="ATTENTE")!(ETATPB="RESOLU"))!(ETATPB="EN COURS") G:NBPB=10 PAUSE D M("en attente de pb a traiter") G CYC2
 S @LPB@(IPB,"ETAT")="EN COURS"
 S TYPEPB=@LPB@(IPB,"TYPE")
 D FINCRIT
 D SOLVEPB(IPB,TYPEPB,ETATPB)
 D DEBCRIT
 G:NBPB=10 PAUSE G CYC2
 
PAUSE D FINCRIT
 H 10
 D DEBCRIT S NBPB=0 G CYC2
 
RECUGEN 
 
 S VAR="" F  S VAR=$O(@TABGEN@("VAR",VAR)) Q:VAR=""  S @VAR=@TABGEN@("VAR",VAR)
 S VAR="" F  S VAR=$O(@TABGEN@("TAB",VAR)) Q:VAR=""  S INDX="" F  S INDX=$O(@TABGEN@("TAB",VAR,INDX)) Q:INDX=""  S @VAR@(INDX)=@TABGEN@("TAB",VAR,INDX)
 Q
 
SOLVEPB(IPB,TYPEPB,ETATPB) 
 N VAR,%V
 N pb,t,r,PB,q,r1,LIGNE,cout,numpbp,FRES,f,TMAX,d
 N optq,fmx,Cqd,qx,q,qopt
 D:ETATPB="A TERMINER" M("epilogue du probleme "_IPB)
 D:ETATPB="A TRAITER" M("traitement du probleme "_IPB)
 S VAR="" F %V=0:0 S VAR=$O(@LPB@(IPB,"VAR",VAR)) Q:VAR=""  S @VAR=@LPB@(IPB,"VAR",VAR)
 G:TYPEPB="F" PBMEF
 G:TYPEPB="TXP2R" PBMETXP^%TXP2RC1
 Q
 
PBMEF 
 G:ETATPB="A TERMINER" TERMF
 
TRTF 
 
 I t>TMAX S PB=@tapb@(pb),TMAX=@tmax@(pb)
 I t'>TMAX S PB=pb
 I r<0 S FRES=30000000 G FINTRTF
 I t>PMAX S FRES=0 G FINTRTF
 S r1=(r\lot)*lot
 I $D(@PRD@(t,r1)) S LIGNE=@PRD@(t,r1),FRES=@prd@(LIGNE,9) G FINTRTF
 
 
 
 
 D DEBCRIT
 S @LPB=@LPB+1
 S @LPB@(@LPB,"TYPE")="TXP2R"
 S @LPB@(@LPB,"ETAT")="A TRAITER"
 S @LPB@(@LPB,"VAR","t")=t
 S @LPB@(@LPB,"VAR","rfixe")=r
 S @LPB@(@LPB,"VAR","pb")=PB
 S @LPB@(@LPB,"VAR","TMAX")=TMAX
 S @LPB@(@LPB,"PBPERE")=IPB
 
 
 
 S @LPB@(IPB,"ATTENTE")=1
 S @LPB@(IPB,"ETAT")="ATTENTE"
 S @LPB@(IPB,"VAR","r1")=r1
 S @LPB@(IPB,"VAR","PB")=PB
 S @LPB@(IPB,"VAR","TMAX")=TMAX
 D FINCRIT
 Q
 
 
FINTRTF 
 
 S cout=@LPB@(IPB,"VAR","cout")
 S numpbp=@LPB@(IPB,"PBPERE")
 
 
 D DEBCRIT
 S f=@LPB@(numpbp,"VAR","f")
 
 I f'>(cout+FRES) G FF2
 S @LPB@(numpbp,"VAR","f")=cout+FRES
 S @LPB@(numpbp,"VAR","fmx")=FRES
 S @LPB@(numpbp,"VAR","qopt")=q
FF2 S @LPB@(numpbp,"ATTENTE")=@LPB@(numpbp,"ATTENTE")-1
 
 
 I @LPB@(numpbp,"ATTENTE")=0 S @LPB@(numpbp,"ETAT")="A TERMINER"
 
 
 K @LPB@(IPB)
 D FINCRIT
 Q
 
 
 
 
 
 
 
TERMF I FRES>3000000 S FRES=30000000 G FINTRTF
 S LIGNE=@PRD@(t,r1),FRES=@prd@(LIGNE,9)
 G FINTRTF
 
 
 
print 
 I ('(VISU#2))=1 Q
 I qx=QMIN W !,!,"***2***"," periode :",t,!,?5,"qt pr",?10,"dde",?20,"stk",?30,"cout",?45,"opt"
 W !,?5,q,?10,d,?20,r,?30,Cqd\1,?55,f\1
 R *zzzz
 Q
 
MAX(a,b) 
 Q $S(a>b:a,1:b)
MIN(a,b) 
 Q $S(a<b:a,1:b)
 
DEBCRIT 
 L +^[QUI]SEMASOL:200 E  W *7,*7,"quelqu'un a la ressource depuis longtemps"
 Q
FINCRIT L -^[QUI]SEMASOL
 Q
 
M(M) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                      ",1,74)_"*" D ^%PKPOP Q

