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

;%QMTRAAT^INT^1^59547,73879^0
QMTRAAT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRA(M,GL,GLI) 
 N %I,%U,%U2,%U3,%U4,%A,%V,%O
 N R,AT,NVAT,VAL,OR,IND,RI,RI2,NL,NL2,TLIEN,RLI,AA,VV,OO,AA2
 S R="" F %I=1:1 S R=$O(@GL@(M,R)) Q:R=""  S AT="" F %U=1:1 S AT=$O(@GL@(M,R,AT)) Q:AT=""  S NVAT=@GL@(M,R,AT),RI=$$NOMINT(M,R,GLI) D:NVAT'=AT MAJ
 Q
MAJ 
 
 S DX=0,DY=22 X XY W "M.A.J de "_R_" : "_AT_" --> "_NVAT
 S TLIEN=$$TLIEN^%QSGES21
 S VAL=""
 F %U2=1:1 S VAL=$O(^[QUI]QUERY2(RI,AT,VAL)) Q:VAL=""  S OR="" F %U3=1:1 S OR=$O(^[QUI]QUERY2(RI,AT,VAL,OR)) Q:OR=""  S IND="" F %U4=1:1 S IND=$O(^[QUI]QUERY2(RI,AT,VAL,OR,IND)) Q:IND=""  D MAJTR
 Q
MAJTR 
 S DX=0,DY=23 X XY W "Individu: "_IND
 D PA^%QSGESTI(RI,IND,NVAT,VAL,OR),PS^%QSGESTI(RI,IND,AT,VAL,OR)
 I '($$QUAL^%QSGEL2(RI,AT)) Q
 
 
 S NL=@TLIEN@(AT,IND,VAL,OR),NL2=NVAT_"\"_$P(NL,"\",2)
 
 S:'($D(@TLIEN@(NVAT))) @TLIEN@(NVAT)=0
 S @TLIEN@(NVAT)=@TLIEN@(NVAT)+1
 S @TLIEN@(AT)=@TLIEN@(AT)-1
 S @TLIEN@(NVAT,IND,VAL,OR)=NL2 K @TLIEN@(AT,IND,VAL,OR)
 
 I @TLIEN@(AT)=0 K @TLIEN@(AT)
 
 D PA^%QSGESTI(RI,IND,"LIEN."_NVAT,NL2,NL2),PS^%QSGESTI(RI,IND,"LIEN."_AT,NL,NL)
 
 S RI2=$$REPD^%QSGEL2(RI,AT)
 D PA^%QSGESTI(RI2,VAL,"INVERSE."_NVAT,NL2,NL2),PS^%QSGESTI(RI2,VAL,"INVERSE."_AT,NL,NL)
 
 S RLI=$$LIENI^%QSGEL3
 S AA=""
 F %A=1:1 S AA=$O(^[QUI]QUERY1(RLI,NL,AA)) Q:AA=""  S VV="" F %V=1:1 S VV=$O(^[QUI]QUERY1(RLI,NL,AA,VV)) Q:VV=""  S OO="" F %O=1:1 S OO=$O(^[QUI]QUERY1(RLI,NL,AA,VV,OO)) Q:OO=""  D MAJLI
 D SX^%QSGESTK(RLI,NL)
 Q
MAJLI 
 
 
 I AA="NOM" D PA^%QSGESTI(RLI,NL2,AA,NL2,OO),PS^%QSGESTI(RLI,NL,AA,NL,OO) Q
 I AA="NOM.LIEN" D PA^%QSGESTI(RLI,NL2,AA,NVAT,OO),PS^%QSGESTI(RLI,NL,AA,AT,OO) Q
 S AA2=AA
 I AA2["SOURCE." S AA2="SOURCE."_NVAT
 I AA2["DESTINATION." S AA2="DESTINATION."_NVAT
 D PA^%QSGESTI(RLI,NL2,AA2,VV,OO),PS^%QSGESTI(RLI,NL,AA,VV,OO)
 Q
NOMINT(M,R,GLI) 
 N %V S %V=@GLI@(M,R) Q %V

