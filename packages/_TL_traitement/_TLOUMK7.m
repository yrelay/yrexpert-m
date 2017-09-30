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

;%TLOUMK7^INT^1^59547,74030^0
%TLOUMK7 ;;05:28 PM  7 Apr 1992; ; 07 Jun 93  4:43 PM
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("$POURVAL",1)="D INSER(""S DEROUT=7,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$POURVAL",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$POURVAL",3)="D COMPIL(I,^[QUI]ANSA(X,4)) D INSER(""S V(""_I_"")=$$GETLIGE^%TLOGCMP(V(""_I_"")) S:V(""_I_"")="""""""" DEROUT=999"")"
 s ^%COMPIL("$POURVAL",4)="D COMPADR(I+3,^[QUI]ANSA(X,1)),COMPADR(I+7,^[QUI]ANSA(X,2)),COMPADR(I+11,^[QUI]ANSA(X,3))"
 s ^%COMPIL("$POURVAL",5)="D INSER(""S V(""_(I+1)_"")=$$PREMORD^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""))"")"
 s ^%COMPIL("$POURVAL",6)="D PUSH(ICCOUR+1) D INSER(""S:V(""_(I+1)_"")="""""""" DEROUT=3"")"
 s ^%COMPIL("$POURVAL",7)="D INSER(""S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+9)_""),V(""_(I+10)_""),V(""_(I+7)_""),V(""_(I+8)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",8)="D INSER(""S V(""_(I+2)_"")=$$GET^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",9)="D INSER(""S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+5)_""),V(""_(I+6)_""),V(""_(I+3)_""),V(""_(I+4)_""),V(""_(I+2)_""))"")"
 s ^%COMPIL("$POURVAL",10)="D INSER(""S DEROUT=2,PAREXE(""""REG"""")=V(""_I_""),PAREXE(""""IEL"""")=1"")"
 s ^%COMPIL("$POURVAL",11)="D INSER(""S V(""_(I+1)_"")=$$ORDSV^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",12)="D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$$PULL()_"""")"
 s ^%COMPIL("$POURVAL",13)="S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 
 
 
 s ^%COMPIL("$AUSCULTER",1)="D INSER(""S DEROUT=7,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$AUSCULTER",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$AUSCULTER",3)="D COMPIL(I,^[QUI]ANSA(X,5)) D INSER(""S V(""_I_"")=$$GETLIGE^%TLOGCMP(V(""_I_"")) S:V(""_I_"")="""""""" DEROUT=999"")"
 s ^%COMPIL("$AUSCULTER",4)="D COMPADR(I+4,^[QUI]ANSA(X,1)),COMPADR(I+8,^[QUI]ANSA(X,2)),COMPADR(I+12,^[QUI]ANSA(X,3)) X ^%COMPIL(""$AUSCULTER"",4,^[QUI]ANSA(X,4)'=0)"
 s ^%COMPIL("$AUSCULTER",4,1)="D COMPCHEM(I+16,^[QUI]ANSA(X,4))"
 s ^%COMPIL("$AUSCULTER",4,0)="D INSER(""S V(""_(I+16)_"")=PARCO(""""REP""""),V(""_(I+17)_"")=PARCO(""""IND"""")"")"
 s ^%COMPIL("$AUSCULTER",5)="D INSER(""S V(""_(I+1)_"")=$$PREMATT^%TLOPTM(V(""_(I+16)_""),V(""_(I+17)_""))"")"
 s ^%COMPIL("$AUSCULTER",6)="D INSER(""S:V(""_(I+1)_"")="""""""" DEROUT=3"")"
 s ^%COMPIL("$AUSCULTER",7)="D INSER(""S V(""_(I+2)_"")=$$PREMORD^%TLOPTM(V(""_(I+16)_""),V(""_(I+17)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$AUSCULTER",8)="D INSER(""S:V(""_(I+2)_"")="""""""" DEROUT=1,PAREXE(""""IEL"""")=""_(ICCOUR+9))"
 s ^%COMPIL("$AUSCULTER",9)="D INSER(""S V(""_(I+3)_"")=$$AFF^%TLOPTM(V(""_(I+6)_""),V(""_(I+7)_""),V(""_(I+4)_""),V(""_(I+5)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$AUSCULTER",10)="D INSER(""S V(""_(I+3)_"")=$$GET^%TLOPTM(V(""_(I+16)_""),V(""_(I+17)_""),V(""_(I+1)_""),V(""_(I+2)_""))"")"
 s ^%COMPIL("$AUSCULTER",11)="D INSER(""S V(""_(I+3)_"")=$$AFF^%TLOPTM(V(""_(I+10)_""),V(""_(I+11)_""),V(""_(I+8)_""),V(""_(I+9)_""),V(""_(I+3)_""))"")"
 s ^%COMPIL("$AUSCULTER",12)="D INSER(""S V(""_(I+3)_"")=$$AFF^%TLOPTM(V(""_(I+14)_""),V(""_(I+15)_""),V(""_(I+12)_""),V(""_(I+13)_""),V(""_(I+2)_""))"")"
 s ^%COMPIL("$AUSCULTER",13)="D INSER(""S DEROUT=2,PAREXE(""""REG"""")=V(""_I_""),PAREXE(""""IEL"""")=1"")"
 s ^%COMPIL("$AUSCULTER",14)="D INSER(""S V(""_(I+2)_"")=$$ORDSV^%TLOPTM(V(""_(I+16)_""),V(""_(I+17)_""),V(""_(I+1)_""),V(""_(I+2)_""))"")"
 s ^%COMPIL("$AUSCULTER",15)="D INSER(""S:V(""_(I+2)_"")'="""""""" DEROUT=1,PAREXE(""""IEL"""")=""_(ICCOUR-5)_"""")"
 s ^%COMPIL("$AUSCULTER",16)="D INSER(""S V(""_(I+1)_"")=$$ATTSV^%TLOPTM(V(""_(I+16)_""),V(""_(I+17)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$AUSCULTER",17)="D INSER(""S:V(""_(I+1)_"")'="""""""" DEROUT=1,PAREXE(""""IEL"""")=""_(ICCOUR-9)_"""")"
 s ^%COMPIL("$AUSCULTER",18)="D INSER(""S DEROUT=3"")"
 s ^%COMPIL("$AUSCULTER",19)="S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 q

