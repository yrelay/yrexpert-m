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

;%AVXR^INT^1^59547,73867^0
%AVXR ;
 
 
 
 
 
 
 
 
 
 
 
 
 
LECMOT(CHL,PTC,MOTLU) 
 N IM
 S MOTLU=$E(CHL,PTC)
 F PTC=PTC+1:1 S IM=$E(CHL,PTC) Q:IM=""  Q:$$SEPAR(IM)  Q:IM="%"  Q:IM=" "  S MOTLU=MOTLU_IM
 Q
 
 
 
 
 
LECCAR(CHL,PTC,CAR) S CAR=$E(CHL,PTC) Q
 
 
 
 
 
 
 
 
 
 
 
 
 
LECNEXT(CHL,CARF,PTC,MOT,OK) 
 
 N IM
 S MOT="",OK=0
 F PTC=PTC+1:1 S IM=$E(CHL,PTC) Q:IM=""  S MOT=MOT_IM I IM=CARF S OK=1 Q
 S:OK MOT=$E(MOT,1,$L(MOT)-1),PTC=PTC+1
 Q
 
 
LETTRE(C) Q:($A(C)'<$A("A"))&($A(C)'>$A("Z")) 1 Q:($A(C)'<$A("a"))&($A(C)'>$A("z")) 1 Q 0
 
CHIFFRE(C) Q:($A(C)'<$A("0"))&($A(C)'>$A("9")) 1 Q 0
 
SEPAR(C) 
 
 
 Q:C="" 0
 Q:C=$C(179) 1 Q:C=$C(180) 1
 Q "|:'!=()+-*/#[]\_;&<>^$%"[C
 
MOTRES(M) Q (((M="SI")!(M="ALORS"))!(M="ET"))!(M="OU")
 
VERBE(M,MOTEUR) 
 
 
 Q $D(^%RQSGLO("MOTEUR",MOTEUR,"VERBE",M))'=0
 
OKLEX(M,PCHCOMP) 
 N CONCUR D ADR^%LXABR(M,.CONCUR,.PCHCOMP)
 I CONCUR=1 Q 1
 S PCHCOMP=M Q 0
 
 
PUSH(TAB,V1,V2,V3) 
 
 D DEPLACE(TAB,0)
 S @TAB@(1)=V1,@TAB@(1,"VAL")=V2,@TAB@(1,"INFO")=V3
 S @TAB=@TAB+1
 Q
PULL(TAB,V1,V2,V3) 
 I @TAB=0 S V1="",V2="",V3="" Q
 
 S V1=@TAB@(1),V2=@TAB@(1,"VAL"),V3=@TAB@(1,"INFO")
 D DEPLACE(TAB,1)
 S @TAB=@TAB-1
 Q
DEPLACE(TAB,SENS) 
 N ii,j,l,p
 S p=@TAB
 
 
 
 I SENS=0 D droite Q
 I SENS=1 D gauche Q
 Q
depl 
droite 
 F ii=p:-1:1 S:$D(@TAB@(ii)) @TAB@(ii+1)=@TAB@(ii) S:$D(@TAB@(ii,"VAL")) @TAB@(ii+1,"VAL")=@TAB@(ii,"VAL") S:$D(@TAB@(ii,"INFO")) @TAB@(ii+1,"INFO")=@TAB@(ii,"INFO")
 Q
gauche 
 F ii=1:1:p-1 S:$D(@TAB@(ii+1)) @TAB@(ii)=@TAB@(ii+1) S:$D(@TAB@(ii+1,"VAL")) @TAB@(ii,"VAL")=@TAB@(ii+1,"VAL") S:$D(@TAB@(ii+1,"INFO")) @TAB@(ii,"INFO")=@TAB@(ii+1,"INFO")
 Q
see(TAB) 
 
 W !," image de la pile  "
 S p=@TAB N i
 F i=1:1:p W !,?3,i,?5,@TAB@(i),?35,@TAB@(i,"VAL"),?60,@TAB@(i,"INFO")
 W !,"******************  fin de pile *********"
 
 Q
test 
 S TAB="polon"
 F j=1:1 D pushpull Q:pushpull=""  D item D:pushpull=1 PUSH(TAB,item,val,info) D:pushpull=0 PULL(TAB,item,val,info) D see(TAB)
pushpull 
 W !,?3," push(1) or pull(0)"
 W !,">>>>>" R pushpull
 Q
item 
 W !,?3," item ,val ,info "
 W !,">>item>>>" R item
 W !,">>val>>>" R val
 W !,">>info>>>" R info
 Q

