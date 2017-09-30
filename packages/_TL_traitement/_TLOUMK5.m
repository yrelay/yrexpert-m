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

;%TLOUMK5^INT^1^59547,74030^0
%TLOUMK5 ;;04:25 PM  7 Apr 1992; ; 07 Jun 93  4:43 PM
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("$TRAITER",1)="D COMPIL(I,^[QUI]ANSA(X,1)) D INSER(""S:'$$EXITRT^%TLOPTM(V(""_I_"")) DEROUT=999"") X ^%COMPIL(""$TRAITER"",1,^[QUI]ANSA(X,2)'=0) D INSER("""")"
 
 s ^%COMPIL("$TRAITER",1,1)="D COMPCHEM(I+1,^[QUI]ANSA(X,2)) D INSER(""S DEROUT=$S($$OKCOMP^%TLOGCMP(V(""_I_"")):2,1:20),PAREXE(""""REP"""")=V(""_(I+1)_""),PAREXE(""""IND"""")=V(""_(I+2)_""),PAREXE(""""TRT"""")=V(""_I_""),PAREXE(""""REG"""")=1,PAREXE(""""IEL"""")=1,PAREXE(""""LIS"""")="""""""""")"
 
 s ^%COMPIL("$TRAITER",1,0)="D INSER(""S DEROUT=$S($$OKCOMP^%TLOGCMP(V(""_I_"")):2,1:20),PAREXE(""""TRT"""")=V(""_I_""),PAREXE(""""REG"""")=1,PAREXE(""""IEL"""")=1,PAREXE(""""LIS"""")="""""""""")"
 
 
 
 
 s ^%COMPIL("$FIN",1)="D INSER(""S DEROUT=3"")"
 
 
 
 s ^%COMPIL("$ABANDON",1)="D INSER(""S DEROUT=4"")"
 
 
 
 s ^%COMPIL("$SORTIR.BOUCLE",1)="D INSER(""S DEROUT=17"")"
 
 
 
 s ^%COMPIL("$FIN.TRAITER.LISTE",1)="D INSER(""S DEROUT=16"")"
 
 
 
 s ^%COMPIL("$PAUSE",1)="D INSER(""S V(""_I_"")=$$TRTMAP^%TLOB17(PARCO(""""TRT""""),PARCO(""""REP""""),PARCO(""""IND"""")) S DEROUT=3"")"
 
 
 
 s ^%COMPIL("$ALLER.A",1)="D COMPIL(I+1,^[QUI]ANSA(X,1)) D INSER(""S V(""_I_"")=$$GETLIGA^%TLOGCMP(V(""_(I+1)_"")) S:V(""_I_"")="""""""" DEROUT=999""),INSER(""S DEROUT=1,PAREXE(""""REG"""")=V(""_I_""),PAREXE(""""IEL"""")=1"")"
 
 
 
 s ^%COMPIL("$ADRESSE",1)="D INSER(""S V(""_I_"")=1"") D SETREGA^%TLOGCMP(^[QUI]ANSA(^[QUI]ANSA(X,1),""TEXTE""))"
 
 
 
 s ^%COMPIL("$ETIQUETTE",1)="D INSER(""S V(""_I_"")=1"") D SETREGE^%TLOGCMP(^[QUI]ANSA(^[QUI]ANSA(X,1),""TEXTE""))"
 
 
 
 
 
 s ^%COMPIL("$REPETER",1)="D INSER(""S DEROUT=7,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$REPETER",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$REPETER",3)="F ZZZ=3:1 Q:'$D(^[QUI]ANSA(X,ZZZ))  Q:^[QUI]ANSA(X,ZZZ)=0  D COMPIL(I,^[QUI]ANSA(X,ZZZ))"
 s ^%COMPIL("$REPETER",4)="D COMPIL(I,^[QUI]ANSA(X,1)) D PUSH(ICCOUR+1) D INSER(""S DEROUT=2,PAREXE(""""REG"""")=$$GETLIGE^%TLOGCMP(V(""_I_"")),PAREXE(""""IEL"""")=1"")"
 s ^%COMPIL("$REPETER",5)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S:'V(""_(I+1)_"") DEROUT=1,PAREXE(""""IEL"""")=""_$$PULL()_"""")"
 s ^%COMPIL("$REPETER",6)="D INSER(""S DEROUT=3"") S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 
 
 
 
 
 s ^%COMPIL("$ITERER",1)="D INSER(""S DEROUT=7,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$ITERER",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$ITERER",3)="D COMPIL(I,^[QUI]ANSA(X,4)) D INSER(""S V(""_I_"")=$$GETLIGE^%TLOGCMP(V(""_I_"")) S:V(""_I_"")="""""""" DEROUT=999"")"
 s ^%COMPIL("$ITERER",4)="D COMPADR(I+3,^[QUI]ANSA(X,1)),COMPADR(I+7,^[QUI]ANSA(X,2)),COMPADR(I+11,^[QUI]ANSA(X,3))"
 s ^%COMPIL("$ITERER",5)="D INSER(""S V(""_(I+1)_"")=$$PREMORD^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""))"")"
 s ^%COMPIL("$ITERER",6)="D PUSH(ICCOUR+1) D INSER(""S:V(""_(I+1)_"")="""""""" DEROUT=3"")"
 s ^%COMPIL("$ITERER",7)="D INSER(""D GETILIE2^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""),.%TP1,.%TP2)"")"
 s ^%COMPIL("$ITERER",8)="D INSER(""S V(""_(I+2)_"")=$$AJCXT^%TLOPTM(V(""_(I+3)_""),%TP1,%TP2) S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+9)_""),V(""_(I+10)_""),V(""_(I+7)_""),1,V(""_(I+1)_""))"")"
 s ^%COMPIL("$ITERER",9)="D INSER(""S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+5)_""),V(""_(I+6)_""),V(""_(I+3)_""),1,%TP2)"")"
 s ^%COMPIL("$ITERER",10)="D INSER(""S DEROUT=2,PAREXE(""""REG"""")=V(""_I_""),PAREXE(""""IEL"""")=1"")"
 s ^%COMPIL("$ITERER",11)="D INSER(""S V(""_(I+1)_"")=$$ORDSV^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$ITERER",12)="D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$$PULL()_"""")"
 s ^%COMPIL("$ITERER",13)="S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 
 q

