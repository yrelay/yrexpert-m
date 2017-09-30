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

;%QSVERI4^INT^1^59547,73883^0
QSVERI4 ;
VERIF4 
 
 
 
 N P,GP,PERE,GPERE,F,IND,L,LL,I,J,K,FAUX,G,LOG,FIN,EXE,NR,U,%U,LGP,LP,LLL
 K @(HIER),@(RR)
 
 
 
 S F=$O(@TEMPO@(M,"NOMBRE DE CLES","")),NR=0
 F I=1:1 Q:F=""  D VER50 S FIN=0,IND=1,@HIER@(IND)=F D:EXE=0 VER51 S F=$O(@TEMPO@(M,"NOMBRE DE CLES",F))
 K @(HIER),@(RR)
 Q
 
VER50 
 
 S EXE=0 Q:(I=1)!(NR=0)  F L=1:1:NR S:@RR@(L)=F EXE=1 Q:EXE=1
 Q
 
VER51 
 
 S P="",FAUX=0
 F J=0:0 S P=$O(@TEMPO@(M,"LIES",F,P)) S:P="" FAUX=1 Q:P=""  S LP="" F U=0:0 S LP=$O(@TEMPO@(M,"LIES",F,P,LP)) Q:LP=""  S:@TEMPO@(M,"LIES",F,P,LP)=1 PERE=P,IND=IND+1,@HIER@(IND)=PERE,NR=NR+1,@RR@(NR)=PERE Q:@TEMPO@(M,"LIES",F,P,LP)=1
 Q:FAUX=1
 
 F LLL=1:1 D VER511 Q:(FIN=1)!(FAUX=1)
 Q
 
VER511 
 
 S GP="",FAUX=0,LOG=0
 S GP=$O(@TEMPO@(M,"LIES",PERE,"")),FAUX=0,LOG=0
 F K=0:0 S GP=$O(@TEMPO@(M,"LIES",PERE,GP)) S:GP="" FAUX=1 Q:GP=""  S LGP="" F %U=0:0 S LGP=$O(@TEMPO@(M,"LIES",PERE,GP,LGP)) Q:LGP=""  D:@TEMPO@(M,"LIES",PERE,GP,LGP)=1 VER52 S:@TEMPO@(M,"LIES",P,GP,LGP)=1 PERE=GPERE,P=PERE,LOG=1 Q:LOG=1
 Q:FAUX=1
 
 Q
VER52 S GPERE=GP,IND=IND+1,@HIER@(IND)=GP,NR=NR+1,@RR@(NR)=GPERE
 F L=1:1:IND-1 F LL=L+1:1:IND D:@HIER@(L)=@HIER@(LL) VER53 Q:@HIER@(L)=@HIER@(LL)
 Q
VER53 S SYNTAX=1,FIN=1
 S ERREUR="<SYNTAX>",%VAR=$$^%QZCHW("Il y a une boucle dans la hierarchie qui comprend les repertoires suivants : ")
 F L=1:1:IND-1 S %VAR=%VAR_" "_@HIER@(L)
 F L=1:1:IND-1 S %VAR=%VAR_"..."_@HIER@(L)_$$^%QZCHW(" fils de ")_@HIER@(L+1)_" ? "
 D WRITE^%QSVERER
 F L=1:1:IND S @HIER@(L)=""
 Q

